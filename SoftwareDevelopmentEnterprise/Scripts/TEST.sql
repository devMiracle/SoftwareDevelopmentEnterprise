
--добавление одной операции по выплате
INSERT INTO SalaryOperations ([EmployeeID], [At], [Sum])
VALUES
((SELECT Id FROM Employees WHERE Id = 1), '15.10.2019', 1000);

--перебить сумму у конкретного работника
UPDATE SalaryOperations
SET [Sum] = 1000
WHERE EmployeeID = 1;

--перебить сумму во всех тикетах выплат
UPDATE SalaryOperations
SET [Sum] = 1000;

--совершить выплату определенному работнику определенное колличество денег
DECLARE @result INT;
EXEC @result = [dbo].[AddPayment]
	@EmployeeID = 6,
	@Money = 1000;
PRINT @result;

--удаление всех сотрудников
DELETE FROM Employees;

--удаление нескольльких сотрудников
DELETE FROM Employees WHERE Id IN (3, 4, 6);

--удаление одного сотрудника
DELETE FROM Employees WHERE Id = 1;

--вывести общую сумму выплат на экран
SELECT dbo.GetBalance();

--вывести все выплаты определенного работника
SELECT * FROM Payouts WHERE EmployeeID = 1;