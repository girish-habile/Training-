drop table MY_EMPLOYEE;

Create table MY_EMPLOYEE(
  id INT,
  last_name VARCHAR(12),
  first_name VARCHAR(12),
  user_id VARCHAR(12),
  salary INT);
  
  Insert into MY_EMPLOYEE(id , last_name, first_name ,salary)
    VALUES
    ('1' ,'Patel','Rajesh','895'),
    ('2' ,'Dancs','Betty','860'),
    ('3' ,'Biri','Ben','1100'),
    ('4' ,'Newman','chad','750'),
    ('5' ,'Ropelemn','Adey','1550');

    SELECT * FROM MY_EMPLOYEE;
    
 Update MY_EMPLOYEE
 SET user_id = substring(first_name , 1, 1) + substring(last_name , 1 , 7);
 
  Update MY_EMPLOYEE
  SET last_name = 'Drexler' Where id =3;
  
  Update MY_EMPLOYEE
  SET salary = 1000 Where salary < 900 ;
  
  Delete  from MY_EMPLOYEE where first_name ='Betty';
 
  ALTER TABLE MY_EMPLOYEE
  ALTER COLUMN last_name VARCHAR(50);


create table students(
  student_id INT PRIMARY KEY,
  first_name VARCHAR(14),
  last_name VARCHAR(14),
  email VARCHAR(50)
)

alter TABLE students
ADD date_of_birth DATE NOT NULL;

SELECT * from students;


-- Date : 12 June 2024

CREATE table Employees(
   EmployeeID INT PRIMARY KEY,
   FirstName VARCHAR(50) NOT NULL,
   LastNAme VARCHAR(50)
)
 

 ALTER table Employees
 ADD CONSTRAINT EmployeeID CHECK(EmployeeID >0)


create table Departements(
    DepartementID INT PRIMARY KEY,
    DepartementName VARCHAR(50) NOT NULL
)



ALTER table Departements
ADD CONSTRAINT DepartementNameUnique  UNIQUE(DepartementName)



create table Projects(
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50) NOT NULL,
     DepartementID INT FOREIGN KEY  REFERENCES Departements(DepartementID)
)

ALTER TABLE Projects
ADD CONSTRAINT chk_length CHECK(LEN(ProjectName) >0)

create table salaries(
  SalaryId INT PRIMARY KEY,
  Amount DECIMAL NOT NULL,
  EmployeeID INT FOREIGN KEY  REFERENCES Employees(EmployeeID)
)

ALTER table salaries
ADD CONSTRAINT Amount CHECK(Amount >0)

ALTER table salaries
ADD CONSTRAINT df_amount  DEFAULT  50000 FOR Amount




create table TimeSheets(
  TimeSheetID INT PRIMARY KEY,
  EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
   Date DATE NOT NULL CHECK (Date <= GETDATE()),
  HoursWorked DECIMAL NOT NULL
)



alter table TimeSheets
ADD CONSTRAINT HoursWorked CHECK(HoursWorked > 0 and HoursWorked < 24)

create table EmployeeProjects(
  EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
   ProjectID INT FOREIGN KEY REFERENCES Projects(ProjectID),
   UNIQUE (EmployeeID, ProjectID)
)

ALTER TABLE Departements
ADD CONSTRAINT chk_DepartmentName_NoNumbers
CHECK (DepartementName NOT LIKE '%[0-9]%')

create table Leaves (
  LeaveId INT PRIMARY KEY,
  EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL ,
  CONSTRAINT EndDate CHECK(EndDate > StartDate)
)

ALTER table Leaves
ADD CONSTRAINT Start_date DEFAULT GETDATE() FOR STARTDATE

create table Reviews(
  ReviewId INT PRIMARY KEY,
  EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
  ReviewerID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
  ReviewDate DATE NOT NULL,
  Score INT NOT NULL,
  CONSTRAINT ReviewerID CHECK(ReviewerId = EmployeeID)
)

ALTER table Reviews
ADD CONSTRAINT Score  CHECK(Score >1 and Score <5)

create table Assets(
  AssetId INT PRIMARY KEY,
  AssetName VARCHAR(50) NOT NULL,
  PurchaseDate DATE NOT NULL,
  EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
  CONSTRAINT Purchase_cons CHECK(PurchaseDate <= GETDATE())
)


drop table Budgets
create table Budgets(
   BudgetId INT PRIMARY KEY,
   DepartementID INT FOREIGN KEY REFERENCES Departements(DepartementId),
   Year INT NOT NULL,
   Amount DECIMAL NOT NULL
   UNIQUE(DepartementID , year)
)


SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'Budgets'


SELECT * from Employees;

--> CHARINDEX
select CHARINDEX('i' , 'Girish') as position
select CHARINDEX('r' , 'Girish') as position
select CHARINDEX('h' , 'Girish') as position

--> CONCAT
SELECT CONCAT('Gir', 'ish') AS name;
select CONCAT('Nimi' , 'sh') as name;
select CONCAT('MN' , 'IT') as college_name;

-->Concat_ws
select CONCAT_WS(' ' , 'My' , 'name' , 'is' , 'Girish')
select CONCAT_WS('.' , '1' , '2' , '3' , '4')
select CONCAT_WS('+ ' , '1' , '2' )

-->Datalength
SELECT DATALENGTH('W3Schools.com');
SELECT DATALENGTH('    W3Schools.com   ');
SELECT DATALENGTH('  W3Schools.com           ');

-->format
SELECT FORMAT(123456789, '##-##-#####');
select FORMAT(12012003 , '##/##/####');
DECLARE @d DATETIME = '12/01/2018';
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',
FORMAT (@d, 'd', 'no') AS 'Norwegian Result',
 FORMAT (@d, 'd', 'zu') AS 'Zulu Result';


-->left
SELECT LEFT('Girish' , 1) as name;
SELECT LEFT('Girish' , 2) as name;
SELECT LEFT('Girish' , 3) as name;

-->right
SELECT right('Girish' , 1) as name;
SELECT right('Girish' , 2) as name;
SELECT right('Girish' , 3) as name;

-->LEN
SELECT LEN('W3Schools.com');
SELECT LEN('    W3Schools.com   ');
SELECT LEN('  W3Schools.com           ');

-->LOWER
SELECT LOWER('SQL TutoriaL');


-->UPPER
SELECT UPPER('SQL TutoriaL');

-->LTRIM
SELECT LTRIM('W3Schools.com');
SELECT LEN(LTRIM('    W3Schools.com   '));
SELECT LTRIM('  W3Schools.com           ');

-->RTRIM
SELECT DATALENGTH('    W3Schools.com   ');
SELECT DATALENGTH(RTRIM('    W3Schools.com   '));
SELECT RTRIM('  W3Schools.com           ');

-->TRIM
SELECT DATALENGTH('  W3Schools.com           ');
SELECT DATALENGTH(TRIM('  W3Schools.com           '))

--->PATINDEX
SELECT PATINDEX('%schools%', 'W3Schools.com');
SELECT PATINDEX('%com%', 'W3Schools.com');

-->QUOTENAME
SELECT QUOTENAME('Girish' , '"');
SELECT QUOTENAME('Girish' , '{}');
SELECT QUOTENAME('Girish' , '[]');

-->replace 
SELECT REPLACE('SQL Tutorial', 'T', 'M');
SELECT REPLACE('Girish', 'i', 'r');

-->replicate
SELECT REPLICATE('SQL Tutorial', 5);
SELECT REPLICATE('Girish',4);
SELECT REPLICATE('SQL', 2);

-->reverese
SELECT REVERSE('SQL Tutorial');
SELECT REVERSE('Girish');
SELECT REVERSE('SQL');

-->SPACE
SELECT SPACE(10);

-->STR
SELECT STR(198.5);
SELECT STR(145.546, 7, 3);

-->STUFF
SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');
SELECT STUFF('gIRISH', 1, 6, 'HARSH');
SELECT STUFF('SQL Tutorial', 6, 3, 'HTML');

-->SUBSTRING
SELECT SUBSTRING('SQL Tutorial', 1, 3) AS ExtractString
SELECT SUBSTRING('SQL Tutorial', 1, 100) AS ExtractString

-->TRANSALATE
SELECT TRANSLATE('Monday', 'MONDAY', 'Sunday');


-->ABS
select abs(-34.5) as absnum;


-->ACOS , ASIN , ATAN
Select ACOS(0.25)
Select ASIN(0.25)
Select ATAN(0.25)

create table products(
   ProuductId INT,
   ProductName VARCHAR(24),
)

INSERT INTO products
VALUES(1 , 'Chais'),
(2 , 'Chang'),
(3 , 'Aniseed Syrup')

--> AVG
SELECT AVG(ProuductId) FROM Products;


-->CEILING
SELECT CEILING(6.75) AS CeilValue;
SELECT CEILING(-3.4) AS CeilValue;

-->FLOOR
SELECT FLOOR(6.75) AS CeilValue;
SELECT FLOOR(-3.4) AS CeilValue;

-->COUNT
SELECT COUNT(ProuductID) AS NumberOfProducts FROM Products;

-->DEGREE
SELECT DEGREES(1.5);

-->EXp
SELECT EXP(3);

-->LOG
SELECT LOG(7);

-->LOG10
SELECT LOG10(10);

-->MAX
SELECT MAX(ProuductId) FROM Products;

-->MIN
SELECT MIN(ProuductId) FROM Products;

-->POWER
SELECT POWER(19, 3);

-->RADIANS
SELECT RADIANS(540);

-->RAND
SELECT RAND()*10 +10;

-->ROUND
SELECT ROUND(235.415, 1) AS RoundValue;

--> SIGN
SELECT SIGN(2);
SELECT SIGN(0);
SELECT SIGN(-1);

-->SQRT
SELECT SQRT(10000);

-->SQUARE
SELECT SQUARE(100);

-->SUM
SELECT SUM(ProuductID) from products


-->CURRENT_TIMESTAMP;
SELECT CURRENT_TIMESTAMP;

--> DateAdd;
SELECT DATEADD(year, 2, '2023/08/07') AS DateAdd;

SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;

SELECT DATEPART(month, '2017/08/25') AS DatePartInt;

SELECT GETUTCDATE();

SELECT ISDATE('absc');

-->cast
SELECT CAST(43.05 AS varchar);

-->COALESCE
SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com');

-->CONVERT
SELECT CONVERT(int, 25.65);

SELECT CURRENT_USER;


-->IIF
SELECT IIF(500<=1000, 'YES', 'NO');

SELECT ISNUMERIC(12345);

-->NULLIF
SELECT NULLIF('YES','YES');

SELECT SESSION_USER;

SELECT USER_NAME();


