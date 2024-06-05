Create Database LoginDemoDB
Go
use LoginDemoDB

Create Table Users (
	Email nvarchar(100) PRIMARY KEY,
	[Password] nvarchar(20) NOT NULL,
	PhoneNumber nvarchar(20) NULL,
	BirthDate DATETIME NULL,
	[Status] int NULL,
	[Name] nvarchar(50) NOT NULL,
	AmountOfGrades int NULL
)
Go

Create Table Grades (
	TestId int  PRIMARY KEY identity(1,1),
	Grade int NOT NULL,
	TestDate DATETIME NULL,
	SubjectName nvarchar(50) NOT NULL,
	StudentEmailId nvarchar(100) NOT NULL,
	constraint FK_EmailToGrades FOREIGN KEY (StudentEmail) References Users(Email)
)
Go

INSERT INTO dbo.Users VALUES ('talsi@talsi.com', '1234', '+972506665835','20-may-1976',1,'Tal Simon', 0)
INSERT INTO dbo.Grades VALUES (99, '23-may-2024', 'Math', 'talsi@talsi.com')
INSERT INTO dbo.Grades VALUES (96, '4-june-2024', 'English', 'talsi@talsi.com')
INSERT INTO dbo.Grades VALUES (6, '29-may-2024', 'Computer Science', 'talsi@talsi.com')
Go

--scaffold-DbContext "Server = (localdb)\MSSQLLocalDB;Initial Catalog=LoginDemoDB;Integrated Security=True;Persist Security Info=False;Pooling=False;Multiple Active Result Sets=False;Encrypt=False;Trust Server Certificate=False;Command Timeout=0" Microsoft.EntityFrameworkCore.SqlServer -OutPutDir Models -Context LoginDemoDbContext -DataAnnotations -force