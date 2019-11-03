CREATE TRIGGER [InsertEmployeeOnLogs]  
ON [dbo].[Employees]
FOR INSERT AS  
IF @@ROWCOUNT = 1
BEGIN  
		INSERT INTO [dbo].[Logs]([Date], [EmployeeID], [Message])
		VALUES
		(GETDATE(), (SELECT inserted.Id FROM inserted),
		CONCAT(N'Добавлен работник: ',
		(SELECT inserted.FirstName FROM inserted),
		N' ',
		(SELECT inserted.LastName FROM inserted),
		N' ',
		(SELECT inserted.MiddleName FROM inserted)
		))
END  
ELSE  
BEGIN  
		INSERT INTO [dbo].[Logs]([Date], [EmployeeID], [Message])
		SELECT GETDATE(), Id, N'Добавлен работник: ' + FirstName + N' ' + LastName + N' ' + MiddleName FROM inserted;
END; 