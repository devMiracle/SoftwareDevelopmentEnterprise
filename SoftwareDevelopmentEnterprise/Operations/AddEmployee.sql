CREATE PROCEDURE [dbo].[AddEmployee]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@MiddleName NVARCHAR(50),
	@Phone NVARCHAR(50),
	@Email NVARCHAR(50),
	@BirthDay DATE,
	@EmploymentDate DATE,
	@PositionTitle NVARCHAR(100),
	@DepartmentTitle NVARCHAR(100)
AS
	BEGIN
		SET NOCOUNT ON;
		DECLARE @DepartID INT;
		SELECT @DepartID = Id FROM Depart WHERE DepartmentName = @DepartmentTitle;
		IF @DepartID IS NULL RETURN 1;
		DECLARE @PosID INT;
		SELECT @PosID = Id FROM Positions WHERE PositionName = @PositionTitle;
		IF @PosID IS NULL RETURN 1;

		IF LEN(@FirstName) < 3 RETURN 2;
		IF LEN(@LastName) < 3 RETURN 2;

		--ВСТАВКА ДАННЫХ
		BEGIN TRY
			BEGIN TRANSACTION
				INSERT INTO Employees (FirstName, LastName, MiddleName, Phone, Email, BirthDay, EmploymentDate, PositionID, DepartmentID)
				VALUES
				(@FirstName, @LastName, @MiddleName, @Phone, @Email, @BirthDay, @EmploymentDate, @PosID, @DepartID);
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