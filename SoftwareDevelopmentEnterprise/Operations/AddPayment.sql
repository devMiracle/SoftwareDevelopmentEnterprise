CREATE PROCEDURE [dbo].[AddPayment]
	@EmployeeID INT,
	@Money SMALLMONEY
AS
BEGIN
	SET NOCOUNT ON;
		--проверка на отрицательную сумму выплаты
		IF @Money < 0 RETURN 1;
		--проверка на начилие операции выплаты
		DECLARE @OperationID INT;
		SELECT @OperationID = Id FROM SalaryOperations WHERE EmployeeID = @EmployeeID;
		IF @OperationID IS NULL RETURN 1;
		--проверка на наличие человека в базе
		DECLARE @TempEmployeeID INT;
		SELECT @TempEmployeeID = Id FROM Employees WHERE Id = @EmployeeID;	
		IF @TempEmployeeID IS NULL RETURN 1;
		--проверка активен ли данный работник
		IF (SELECT AtExecution FROM Employees WHERE Id = @EmployeeID) = 'FALSE' RETURN 1;
		--проверка на наличие денег выплаты
		DECLARE @Sum1 SMALLMONEY;
		SELECT @Sum1 = [Sum] FROM SalaryOperations WHERE EmployeeID = @EmployeeID;
		IF @Sum1 < @Money RETURN 1;
		DECLARE @TempMoney SMALLMONEY;
	BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO Payouts (EmployeeID, [Date], [Money])
			VALUES
			(@TempEmployeeID, CONVERT (DATE, GETDATE()), @Money);
			DECLARE @Result SMALLMONEY;
			UPDATE SalaryOperations
			SET [Sum] = @Sum1 - @Money
			WHERE EmployeeID = @EmployeeID;
			SELECT @TempMoney = [Sum] FROM SalaryOperations WHERE EmployeeID = @EmployeeID;
			IF @TempMoney = 0 DELETE SalaryOperations
			WHERE EmployeeID = @EmployeeID;
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT ERROR_NUMBER();
		PRINT ERROR_MESSAGE();
		RETURN 3;
	END CATCH
RETURN 0
END