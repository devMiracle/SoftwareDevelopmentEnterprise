CREATE TRIGGER [DeleteEmployeeOnLogs]  
ON [dbo].[Employees]
INSTEAD OF DELETE AS  
IF @@ROWCOUNT = 1
BEGIN  
   DECLARE @Id INT;
		SELECT @Id = deleted.Id FROM deleted;
		INSERT INTO [dbo].[Logs]([Date], [EmployeeID], [Message])
		VALUES
		(GETDATE(), (SELECT deleted.Id FROM deleted),
		CONCAT(N'Приостановлен работник: ',
		(SELECT deleted.FirstName FROM deleted),
		N' ',
		(SELECT deleted.LastName FROM deleted),
		N' ',
		(SELECT deleted.MiddleName FROM deleted)
		))
		--апдейт строки вместо удаления
		UPDATE Employees
		SET
		AtExecution = 'FALSE'
		WHERE Id = @Id;
END  
ELSE  
BEGIN  
		INSERT INTO [dbo].[Logs]([Date], [EmployeeID], [Message])
		SELECT GETDATE(), deleted.Id, N'Приостановлен работник: ' + deleted.FirstName + N' ' + deleted.LastName + N' ' + deleted.MiddleName FROM deleted;
		
		UPDATE Employees 
		SET
		Employees.AtExecution = 'FALSE'
		WHERE Employees.Id IN (SELECT deleted.Id FROM deleted);
END; 