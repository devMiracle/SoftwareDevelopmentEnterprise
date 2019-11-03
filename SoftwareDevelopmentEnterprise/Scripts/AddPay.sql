USE Enterprise;
DECLARE @result INT;
EXEC @result = [dbo].[AddPayment]
	@EmployeeID = 2,
	@Money = 700;
PRINT @result;