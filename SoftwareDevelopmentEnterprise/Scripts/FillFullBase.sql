/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/





INSERT INTO Positions (PositionName)
VALUES
(N'Программист'),
(N'Бухгалтер'),
(N'Начальник_участка'),
(N'Директор'),
(N'Начальник'),
(N'Сварщик'),
(N'Рабочий_склада');

INSERT INTO Depart (DepartmentName)
VALUES
(N'ИТ_Отдел'),
(N'Бухгалтерия'),
(N'Руководство'),
(N'Подрядная_организация');





INSERT INTO Employees (FirstName, LastName, MiddleName, Phone, Email, BirthDay, EmploymentDate, PositionID, DepartmentID)
VALUES
(N'Дмитрий', N'Бабичев', N'Максимович', N'+38(098)000-00-00', NULL, '2000.11.04', '2019.01.01', (SELECT Id FROM Positions WHERE PositionName = N'Программист'), (SELECT Id FROM Depart WHERE DepartmentName = N'ИТ_Отдел')),
(N'Иван', N'Сафошин', N'Иванович', N'0975554447', N'QWERTY%@gmail.com', '1995.05.12', '2019.01.01', (SELECT Id FROM Positions WHERE PositionName = N'Бухгалтер'), (SELECT Id FROM Depart WHERE DepartmentName = N'Бухгалтерия')),
(N'Олег', N'Швыдченко', N'Александрович', N'+38097656 34 12', N'bgfv123qw@gmail.com', '1986.01.06', '2019.01.01', (SELECT Id FROM Positions WHERE PositionName = N'Начальник'), (SELECT Id FROM Depart WHERE DepartmentName = N'Руководство')),
(N'Максим', N'Бабичев', N'Сергеевич', N'0985552311', N'007aswar@mail.ru', '1980.05.11', '2019.01.01', (SELECT Id FROM Positions WHERE PositionName = N'Рабочий_склада'), (SELECT Id FROM Depart WHERE DepartmentName = N'Подрядная_организация')),
(N'Александр', N'Швыдченко', N'Олегович', N'+38(098)123-33-00', N'435hgt@gmail.com', '2001.12.12', '2019.01.01', (SELECT Id FROM Positions WHERE PositionName = N'Сварщик'), (SELECT Id FROM Depart WHERE DepartmentName = N'Подрядная_организация')),
(N'Владимир', N'Чайка', N'Михайлович', N'098651123', N'tyaarre@mail.ru', '1969.02.02', '2019.01.01', (SELECT Id FROM Positions WHERE PositionName = N'Директор'), (SELECT Id FROM Depart WHERE DepartmentName = N'Руководство')),
(N'Вадим', N'Бойко', N'Владимирович', N'+38(097)344-00-54', N'322df%@gmail.com', '1991.07.04', '2019.01.01', (SELECT Id FROM Positions WHERE PositionName = N'Программист'), (SELECT Id FROM Depart WHERE DepartmentName = N'ИТ_Отдел'));

INSERT INTO Payouts (EmployeeID, [Date], [Money])
VALUES
((SELECT Id FROM Employees WHERE Id = 1), '15.01.2019', 500),
((SELECT Id FROM Employees WHERE Id = 1), '25.01.2019', 200),
((SELECT Id FROM Employees WHERE Id = 1), '28.01.2019', 100),
((SELECT Id FROM Employees WHERE Id = 2), '15.01.2019', 150),
((SELECT Id FROM Employees WHERE Id = 2), '25.01.2019', 100),
((SELECT Id FROM Employees WHERE Id = 2), '28.01.2019', 50),
((SELECT Id FROM Employees WHERE Id = 3), '15.01.2019', 700),
((SELECT Id FROM Employees WHERE Id = 3), '25.01.2019', 200),
((SELECT Id FROM Employees WHERE Id = 3), '28.01.2019', 100),
((SELECT Id FROM Employees WHERE Id = 4), '15.01.2019', 150),
((SELECT Id FROM Employees WHERE Id = 4), '25.01.2019', 100),
((SELECT Id FROM Employees WHERE Id = 4), '28.01.2019', 50),
((SELECT Id FROM Employees WHERE Id = 5), '15.01.2019', 200),
((SELECT Id FROM Employees WHERE Id = 5), '25.01.2019', 150),
((SELECT Id FROM Employees WHERE Id = 5), '28.01.2019', 50),
((SELECT Id FROM Employees WHERE Id = 6), '15.01.2019', 1200),
((SELECT Id FROM Employees WHERE Id = 6), '25.01.2019', 800),
((SELECT Id FROM Employees WHERE Id = 6), '28.01.2019', 500),
((SELECT Id FROM Employees WHERE Id = 7), '15.01.2019', 500),
((SELECT Id FROM Employees WHERE Id = 7), '25.01.2019', 200),
((SELECT Id FROM Employees WHERE Id = 7), '28.01.2019', 100);


INSERT INTO SalaryOperations ([EmployeeID], [At], [Sum])
VALUES
--(1, '15.10.2019', 500);
((SELECT Id FROM Employees WHERE Id = 1), '15.10.2019', 1000),--есть ли разница с предыдущим примером?
((SELECT Id FROM Employees WHERE Id = 2), '15.10.2019', 750),
((SELECT Id FROM Employees WHERE Id = 3), '15.10.2019', 200),
((SELECT Id FROM Employees WHERE Id = 4), '15.10.2019', 150),
((SELECT Id FROM Employees WHERE Id = 5), '15.10.2019', 650);