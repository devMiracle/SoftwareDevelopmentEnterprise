CREATE TABLE [dbo].[Employees]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(50) NOT NULL, 
    [MiddleName] NVARCHAR(50) NULL DEFAULT N'n/a', 
	[Phone] NVARCHAR(50) NOT NULL UNIQUE CHECK(Phone != ''),
	[Email] NVARCHAR(50) UNIQUE,
    [BirthDay] DATE NOT NULL, 
    [EmploymentDate] DATE NOT NULL,
	[AtExecution] BIT NOT NULL DEFAULT N'TRUE',
    [PositionID] INT NOT NULL, 
	FOREIGN KEY (PositionID) REFERENCES Positions (Id),
    [DepartmentID] INT NOT NULL,
	FOREIGN KEY (DepartmentID) REFERENCES Depart (Id)
	)
