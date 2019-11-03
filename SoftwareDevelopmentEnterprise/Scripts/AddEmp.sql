DECLARE @result INT;
EXEC @result = dbo.AddEmployee
	@FirstName = N'Максим',
	@LastName = N'Иванов',
	@MiddleName = N'Сергеевич',
	@Phone = N'+38(098)111-22-33',
	@Email = N'qwerty111@gmail.com',
	@BirthDay = N'2000.11.04',
	@EmploymentDate = N'2019.01.01',
	@PositionTitle = N'Программист',
	@DepartmentTitle = N'ИТ_Отдел';