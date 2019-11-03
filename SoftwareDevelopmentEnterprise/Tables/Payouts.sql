CREATE TABLE [dbo].[Payouts]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [EmployeeID] INT NOT NULL REFERENCES Employees(Id), 
    [Date] DATE NOT NULL, 
    [Money] SMALLMONEY NOT NULL,


)
