--* Install developer version for all the features for free, but it cannot be used in production. Enterprice and standard is paid. free version is  express but it lack lot of features. so better download developer for learning and testing.
--* install SQL server as well as sql server management studio

SELECT 1 + 1;
-- we can directly use select like this
SELECT 1 + 1 AS Result; -- so the output column will be typed as output column
GO
--* GO signals the end of a batch of Transact-SQL statements to the SQL Server utilities.
--* always try to add a go after a ddl statement (data definition)
-- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/sql-server-utilities-statements-go?view=sql-server-ver15#:~:text=GO%20is%20not%20a%20Transact,an%20instance%20of%20SQL%20Server.
CREATE TABLE tblName --name in hungarian notation
(
    ColumnName int
    --type
)
-- https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-tables-database-engine?view=sql-server-ver15
INSERT INTO tblName
    (ColumnName)
--+ mentioning column name is optional but we can insert the values in different form if we mention it in different form
Values(1);
--! To refresh  intellisense go to edit, intellisense,refresh local cache (cntrl + shift + R)

SELECT column_name
FROM tblName
DELETE FROM tblName
--for deleting data from the table
TRUNCATE TABLE tblName
-- for deleting the entire data
DROP TABLE tblName
--% for deleting the table
--+ delete can roll back, truncate cannot
--+ truncate reset the identity, delete wont
--+ we can delete specific data using delete

--! DECLAREing a variable
DECLARE @var AS INT = 3;
--* variable name should have a @, AS is optional, also initialising also optional
SET @var = 5;
--* we can set the value using a SET keyword
SET @var = @var + 1;

--! Integer Data Type
-- https://docs.microsoft.com/en-us/sql/t-sql/data-types/int-bigint-smallint-and-tinyint-transact-sql?view=sql-server-ver15
--* TINYINT, SMALLINT, INT, BIGINT

--! Decimal and numeric
--+ Decimal and numeric are almost same
--+ Decimal(precision, scale) DECIMAL(Howmany total numbers can it have, what is the number after the point)
--+ DECIMAL(5,2) 123.12 is valid and 1234.1 is not valid
--+ Dont give default value for decimal, it is a huge value and it takes nine bytes == Decimal(18,8)
-- https://docs.microsoft.com/en-us/sql/t-sql/data-types/decimal-and-numeric-transact-sql?view=sql-server-ver15
--! money and smallmoney
-- https://docs.microsoft.com/en-us/sql/t-sql/data-types/money-and-smallmoney-transact-sql?view=sql-server-ver15
--! float and real

--! mathematical operations
--+ -,+,*,/,%,
--+ to find the power we have a fuction POWER(value, power)
SELECT POWER(3, 2);
SELECT SQUARE(3)
--+ for finding square
SELECT SQRT(3)
--+ for finding the squere root

SELECT FLOOR(100.123)
--+ floor will round to the lowest
SELECT CEILING(100.123)
--+ ceiling will round to the highest
SELECT ROUND(100.123, 0)
--+ round will go to the nearest as we mentioned in the second parameter, round may not give exact output as we intented
--https://docs.microsoft.com/en-us/sql/t-sql/functions/round-transact-sql?view=sql-server-ver15
SELECT PI()
-- you know what it is
SELECT EXP(1)
SELECT ABS(-123)
--+ Change -ve to positive
SELECT SIGN(-123)
--+ give -1 for -ve and give 1 for positive values 0 for 0
SELECT RAND(9898)
-- to get a random number

--! explicit conversion of numbers
SELECT CONVERT(DECIMAL(5, 0), 3)
--+ convert(expected type, input)
SELECT CAST(3 AS Decimal(5, 0))
--+ (input as expected type)
--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15

--! string
--* char          ASCII system, which have only english , 1byte
--* varchar       ASCII system, which have only english , 1byte for a charector
--* nchar         UNICODE system which can have possibly more languages, 2 byte
--* nvarchar      UNICODE system which can have possibly more languages, 2 byte
-- https://docs.microsoft.com/en-us/sql/t-sql/data-types/char-and-varchar-transact-sql?view=sql-server-ver15
--! here n is not stands for number of charectors. it is nstring length in byte-pairs. usually for ASCII, all the charectors are 1 bytes.
--! so it might look like the same. but in the Unicode range 0-65,535, one character can be stored per each byte-pair, so in that case, the
--! one charector can go to more that 2 bytes. if we declare a nchar of 4 and try to insert 3 charector which can have 6 bytes, then only 2 charectors inserted
--! it will usually work for char and varchar, because of ascii and it might have 1 byte. it will fail in charectors with higher code.
SELECT LEN('hello')
--+ len() can be used to find the length of the string.
DECLARE @name char(10) = 'ans';
SELECT DATALENGTH(@name);
--+ DataLength() will give the maximum lenth it can take

--* when we insert nvarchar, we need to specify N in the input or it will not take the proper input
DECLARE @name nchar(10) = N'ﻑﻑﻑﻑ';
--+ but it is fine if we use or not use in char or varchar
--https://stackoverflow.com/questions/14353238/what-does-n-stands-for-in-a-sql-script-the-one-used-before-characters-in-ins/14353275#:~:text=The%20%22N%22%20prefix%20stands%20for,from%20NVARCHAR%20%2C%20NCHAR%20or%20NTEXT%20.
-- https://www.sqlshack.com/query-performance-issues-on-varchar-data-type-using-an-n-prefix/

--! string functions
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver15
--* left and right
select left(@name, 2)
--+ for getting left 2 charectors
select right(@name, 2)
--+ for getting right 2 charectors
--* substring
select substring(@name, 2, 3)
--+ for getting the substring of a string. and sql is not a zero based language . so first charecter is indexed 1.
--+ it will go to 2nd letter and take next 3 letters
--* trimming the whitespace (ltrim and rtrim)
select ltrim(@name)
--+ it will trim the whitespace from the left
select rtrim(@name)
--+ it will trim the whitespace from the right
select trim(@name)
--+ this will trim from both sides

--* replace
select replace(@name,'a','A');
--+ this will replace a with A

--* upper and lower
select upper(@name)
--+ this wll convert all char to upper
select lower(@name)
--+ this wll convert all char to lower

--* STRING_SPLIT
select STRING_SPLIT(@name,' ')
--+ we can split the string using this function . and we can give the seperator

--! NULL
-- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/null-and-unknown-transact-sql?view=sql-server-ver15#:~:text=NULL%20indicates%20that%20the%20value,an%20empty%20or%20zero%20value.&text=To%20test%20for%20null%20values,NULL%20in%20the%20WHERE%20clause.

--+ defailt value in sql server will be NULL
--+ NULL is a value which sql server doesnt know
DECLARE @value INT;
SELECT @value
--+ this will return NULL
SET @value = @value+2;
SELECT @value;
--+ this will still return NULL.. because we are trying to add with a value that we dont know
--* thi is same for string

--! TRY_PARSE AND TRY_CAST
--* returns null if the casting fails
--https://docs.microsoft.com/en-us/sql/t-sql/functions/try-parse-transact-sql?view=sql-server-ver15
--! joining strings
declare @fn string,@mn string, @ln string
set @fn = 'ans';
set @mn = 'muh';
select @fn + ' ' + @mn + ' ' + @ln as fullname;
--+ result will be null. because @Mn is null
--+ nothing will work with null, = also will not work
--! iif
--https://docs.microsoft.com/en-us/sql/t-sql/functions/logical-functions-iif-transact-sql?view=sql-server-ver15
select @fn + iif(@mn is null, '', ' ' + @mn) + ' ' + @ln
--+ iif(condition, output for true, output for false), same as turnery operator
--!CASE
--https://docs.microsoft.com/en-us/sql/t-sql/language-elements/case-transact-sql
select @fn + CASE WHEN @mn is null THEN '' ELSE ' ' END + @mn + ' ' + @ln;
--+ CASE WHEN CONDITION THE OUTPUT FOR TRUE ELSE OUTPUT FOR FALSE
--! coalesce
--https://docs.microsoft.com/en-us/sql/t-sql/language-elements/coalesce-transact-sql?view=sql-server-ver15
select @fn + coalesce(' ' + @mn ,'') + ' ' + @ln
--+ it can take lot of parameters. it will check the first parameter null or not, if it is, then it will go to next parameter
--+ then next and then next till it reaches the not mull value.
--! CONCAT
--https://docs.microsoft.com/en-us/sql/t-sql/functions/concat-transact-sql?view=sql-server-ver15#:~:text=CONCAT%20takes%20a%20variable%20number,to%20string%20types%20before%20concatenation.
SELECT CONCAT(@fn, ' '+ @mn, ' ', @ln)
--+ concat will add the strings

--! Adding string with Number
select 'abc' + 1;
--+ this will not convert the number to string. instead it will try to convert from string to number. becase there are some priorities for the type
-- https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-type-precedence-transact-sql?view=sql-server-ver15

--! format string
select format(2324.4, 'C', 'en-GL')
--+ format will format the input to specific format. and the second argument is for what format, currency or decimal, third argument is culture info.
--https://docs.microsoft.com/en-us/sql/t-sql/functions/format-transact-sql?view=sql-server-ver15

--! Date types
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver15
--+ DATETIME2   more accuracy
--+ DATETIME  less accuracy, only 3,7,0 values in the 3rd nanosecond. 11:11:11.113, 11:11:11.117, 11:11:11.110 . everything else will be rounded
--* DATE AND TIME FORMAT WILL BE IN DECRESING ORDER
--+ YYYY-MM-DD HH:MM:SS.NNN -- here year is first then month then day and then hour minute and seconds.
--+ the paranthesis in DATETIME2 is for the accuracy of milly seconds. how accurate you want. datetime2(3) 2020-08-22 03:44:23.123, datetime2(5) 2020-08-22 03:44:23.12345 and so on.
-- + more accuracy will take more bytes

--! FromParts function
SELECT DATEFROMPARTS(2020, 09, 22)
--+ this will generate a date value
SELECT DATETIME2FROMPARTS(2020, 09, 22, 09, 33, 1234, 4)
--+ this will generate a datetime2 value, last parameter is the accuracy

--! Year month and day function
--* we can extract the year, month and day
declare @dateTime datetime2(7) = '2020-08-02 12:45:33.1234567'
SELECT year(@dateTime), month(@dateTime), day(@dateTime);

--! Current datetime
SELECT CURRENT_TIMESTAMP;
--+ returns current dat time in datetime format
select getdate();
--+ returns current dat time in datetime format
select SYSDATETIME()
--+ this will return current datetime in datetime2

--!Adding to the date
select dateadd(year, 1, @dateTime)
--+ we can give month, year, hour, minute anything.

select datepart(hour, @dateTime)
--+ this will extract the specific part

select datediff(month, @dateTime, getdate())
--+ gives the difference in months, eirly date will be first parameter

--! datetimeoffset(from UTC)
--https://docs.microsoft.com/en-us/sql/t-sql/data-types/datetimeoffset-transact-sql?view=sql-server-ver15
--* this is the datetime with timezone, from UTC
declare @offsetv datetimeoffset(2) = '2020-08-02 12:45:33.123 +05:30'
Select todatetimeoffset('2020-08-02 12:45:33.123', '+05:30')
--+ this will add to offset timezone,not for converting, just to add the timezone info. this will not channge the datetime, instead it wil add just the +5:30 timezone information
SELECT DATETIME2FROMPARTS(2020, 09, 22, 09, 33, 1234,05,30, 4)
--+ here before the accuracy we need to send the timezone info
--* offset time is not utc and indication of timezone. it is already in local time and indication of timezone.
select sysdatetimeoffset()
--+ this will give local timezone
select sysutcdatetime()
--+ this will give the utc time.
select switchoffset(offsetv, '-5:00')
--+ this is for converting from ine timezone to another

--! AT TIME ZONE
--* this function is a combination of both todatetimeoffset and switchoffset. if the input is not in offset, it will work as todatetimeoffset, else switchoffset.
--+ takes 2 inputs, datetime and the timezone. which can be fund from sys.time_zone_info . select * from sys.time_zone_info. pass the string as the timezone info. it will take care of the daylight saving
SELECT sysutcdatetime() AT TIME ZONE 'Central European Standard Time'
-- as this is not offset, it will only add the timezone info. to convert it. it should be in offset format
--+ so we can make it to offset and then convert it. so 2 ways
SELECT sysutcdatetime()  AT TIME ZONE 'UTC'AT TIME ZONE 'Central European Standard Time';
--+ convert to utc offset then to central
SELECT todatetimeoffset(sysutcdatetime(), '+00:00') AT TIME ZONE 'Central European Standard Time';
--+ add 00 to offset and then convert. both are same

--! converting a datetime
--+ we can convert from string to date and date to string
declare @dateTime datetime2(7) = '2020-08-02 12:45:33.1234567'
Select Convert(varchar(20),@dateTime );
Select Cast(@dateTime AS varchar(20));
Select Convert(datetime2(7),'2020-08-02 12:45:33.1234567' );
Select Cast('2020-08-02 12:45:33.1234567' AS datetime2);
Select Cast('thursday, 25 june 2020' AS date);
--+ this will fail if we give input like thursday, 25 june 2020.

--+ for that we need a smart way to convert this
--! Parse
--https://docs.microsoft.com/en-us/sql/t-sql/functions/parse-transact-sql?view=sql-server-ver15
--* use to parse from string to number or datetime, parse have performance issue
select Parse('thursday, 25 june 2020' as datetime2(7))
--* better

--* we can use format for doing more convertion
select format(@dateTime, D)
--+ D for long date format, d for small date format --* better
select format(@dateTime, 'MM-DD-YYYY')
--+ we can specify the format, for month it should be MM, for minutes, it should be mm
select format(@dateTime, 'MM-DD-YYYY','es-ES')
--+ we can pass the culture information as well


--! Altering a table
ALTER TABLE tblName
ADD LastName VARCHAR(10);
-- 10 bytes isnt enough
--* To modify the existing column, there are two ways
--%DROP and Insert
ALTER TABLE tblName
DROP COLUMN LastName;
--+ this will drop the column

ALTER TABLE tblName
ADD LastName VARCHAR(15);
-- 15 isnt enough

--% Alter the column
ALTER TABLE tblName
ALTER Column LastName VARCHAR(50)
--+ this will alter the column using alter column cammand

--! Retrieving records
select *
from tblName
where firstName =  'a';
select *
from tblName
where firstName <> 'a';
--+ <> stands for not equals

select *
from tblName
where not firstName = 'a';
--+ we can use not before the where as well

--% for finding patterns we can use LIKE
--https://docs.microsoft.com/en-us/sql/t-sql/language-elements/like-transact-sql?view=sql-server-ver15
select *
from tblName
where firstName like 'a';
--+ this will do a equal search

select *
from tblName
where firstName like 'a%';
--+ this will search everything starts with a. % indicated that 0 to infinite chrectors. %a indicates, starts with a.

select *
from tblName
where firstName like '%a%';
--+ This will do a contains search, a can be anywhere

select *
from tblName
where firstName like '_a%';
--+_ indicates 1 charector, so here it will start search from second charector.

select *
from tblName
where firstName like '[r-t]%';
--+ this will start searching for r,s,t in the first letter. [rst] will also work

select *
from tblName
where firstName like '[^rst]%';
--+ this will search for first letter other than r, s, t

--+ if i want to search for any system charector like %, we can put it inside []

select *
from tblName
where firstName like '[%]%';
--+ we can search first charectr as %

--! between
select *
from tblname
where dateOfBirth between '' and ''

--% Another way to do is

select *
from tblname
where dateOfBirth >= '' and dateOfBirth < '';

select *
from tblname
where year(dateOfBirth) between 1995 and 2000
--Not the best way

--! Group by
select year(dateOfBirth), count(*) tblName
group by year(dateOfBirth)
--https://docs.microsoft.com/en-us/sql/t-sql/queries/select-group-by-transact-sql?view=sql-server-ver15
--* SQL server will do the from, where and groupb first, then only it will select. after group by, we will not have normal columns

--! Order by
--https://docs.microsoft.com/en-us/sql/t-sql/queries/select-order-by-clause-transact-sql?view=sql-server-ver15
select year(dateOfBirth), count(*) tblName
group by year(dateOfBirth)
ORDER BY year(dateOfBirth) ASC
-- orr desc

--% For getting the number of employees starting with same letter
select TOP(5)
    left(firstName), count(*)
FROM tblEmployee
-- we can use top keyword just after the select statement
GROUP BY left(firstName, 1)
order by count(*) desc

--! Having
--* Having will be evaluated after the group for filtering grouped items
--% For getting the number of employees starting with same letter which is less than 50
select TOP(5)
    left(firstName), count(*)
FROM tblEmployee
-- we can use top keyword just after the select statement
GROUP BY left(firstName, 1)
Having count(*) < 50
--+ this will filter the group items
order by count(*) desc
--* count(*), sum(columnname), min(), max() - lot of functions can be used

--! NULLIF()
--* use to make the value null
SELECT NULLIF(yourCoumnName,'') as anyVariableName
from yourTableName;

--% table for the examples
CREATE TABLE tblEmployee
(
    [EmployeeNumber] [int] NOT NULL,
    [EmployeeFirstName] [varchar](50) NOT NULL,
    [EmployeeMiddleName] [varchar](50) NULL,
    [EmployeeLastName] [varchar](50) NOT NULL,
    [EmployeeGovernmentID] [char](10) NULL,
    [DateOfBirth] [date] NOT NULL,
    [Department] [varchar](19) NULL
)

create table tbiTransaction
(
    [Amount] smallmoney NOT NULL,
    [DateOfTransaction] smalldatetime NULL,
    [EmployeeNumber] int NOT NULL
)

--! JOIN
--* it is not necessary to alias in joins. we can use the tblname, if that is a unique column name, we dont need to use the tblname

select tblemployee.EmployeeNumber, firstName, LastName, sum(Amount)
from tblemployees
    join tblTransaction on tblemployee.EmployeeNumber = tbltransaction.EmployeeNumber
--+ here we can see some raws got skipped from tblemployees even if there is specific employeenumber, but not there in tblemployee
group by tblemployee.EmployeeNumber, firstName, LastName
order by employeeNumber
--* JOIN is INNER JOIN as default

--* INNER JOIN takes only if both table have the value
--* LEFT JOIN Takes all from the right.
--* RIGHT JOIN All from thr right
--* CROSS JOIN it will make all the combinations. output will be left toltal multiplie right total

--! Multiple select in a query
select count(department) as numberofdepartments
from (       --+ here we can find the number of departments that we will not be able to do in inner query
select department, count(*) as numberperdepartment
    --+ This can be onsider as another table result and we can do more query on it. like, we can find the count of departments
    from tblemployee
    group by Department) as departments

--! Distinct

select distinct(Department)
from tblemployee
--+ this will give the unique values

--!IN TO
--* we can use into keyword between the select and from, it will create a new table and insert the data
select distinct(Department) as department, '' as departmentHead
into tblDepartment
--+ this will create a new table tblDepartment and insert the values in to it
from tblemployee

--% #rd Table
create table tblDepartment
(
    [Department] [varchar](19) NULL,
    [DepartmentHead] [varchar](30) NULL
)

--% Joining 3 TABLES
select *
from tblDepartment.Department, DepartmentHead, Sum(Amount)
    left join tblemployee on tblDepartment.Department = tblemployee.Department
    left join tblTransaction on tblDepartment.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblDepartment.Department,DepartmentHead

--! Deleting the table rows
--* We can use normal joins to delete the rows, we cannot use orderby or group by in delete statement
delete tblTransaction
from tblEmployee as E
    right join tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber = NULL
--+ this will delete records from tblTransaction where there is no employees cinnected

--% another approach - get the all records manually and take the value and pass as the input to the delete
begin transaction
--+ We can use transactions for checking before deleting it, and we can rollback them.
select count(*)
from tblTransaction
delete tblTransaction from tblTransaction
    where EmployeeNumber IN
    (select TNumber
from (
        select E.EmployeeNumber as ENumber, E.EmployeeFirstName, E.EmployeeLastName, T.EmployeeNumber as TNumber, sum(T.Amount) as TotalAmount
    from tblEmployee as E
        right join tblTransaction as T
        on E.EmployeeNumber = T.EmployeeNumber
    group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
        E.EmployeeLastName) as newTable
where ENumber is null)
select count(*)
from tblTransaction
rollback transaction

--! Update table
update tblTransaction set employeeNumber = 194
where employeeNumber in (1,2,3)

--! output keyword
--*we can output the modified rows using output keyword
--https://docs.microsoft.com/en-us/sql/t-sql/queries/output-clause-transact-sql?view=sql-server-ver15
update tblTransaction set employeeNumber = 194
output inserted.*, updated.*                           --+ here we can see the inserted and deleted records, or any of them
where employeeNumber in (1,2,3)

--% we can get specific columns as well
update tblTransaction set employeeNumber = 194
output inserted.employeeNumber, updated.employeeNumber
where employeeNumber in (1,2,3)

--! @@Rowcount
--* we can use @@Rowcount to get the number of rows effected
update tblTransaction set employeeNumber = 194
where employeeNumber in (1,2,3)
select @@Rowcount

DECLARE @MyTableVar table (
    ProductID int NOT NULL,
    ProductName nvarchar(50)NOT NULL,
    ProductModelID int NOT NULL,
    PhotoID int NOT NULL);
DELETE Production.ProductProductPhoto
OUTPUT DELETED.ProductID,
       p.Name,
       p.ProductModelID,
       DELETED.ProductPhotoID
    INTO @MyTableVar                        --+ we can set the values to another table or variable
FROM Production.ProductProductPhoto AS ph
    JOIN Production.Product as p
    ON ph.ProductID = p.ProductID
    WHERE p.ProductModelID BETWEEN 120 and 130;

--* While doing an insert, everything will be inserted if suceed. if any item fails, none of the item will be get inserted

--! Constraints
--! Unique constraint
--https://docs.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver15#:~:text=You%20can%20create%20a%20unique,creates%20a%20corresponding%20unique%20index.
--https://docs.microsoft.com/en-us/sql/relational-databases/tables/unique-constraints-and-check-constraints?view=sql-server-ver15
alter table tblemployees
add constraint UNQGovernmentID UNIQUE(EmployeeGovernmentID)
--* Adding a unique constraint will add a key and a index(Non clustered), it will not be inside constaints
--% we can add unique key constraint to multiple columns as well
--* Adding unique key will check for the existence raws and return error
alter table tbltransaction
add constraint UNQTransaction UNIQUE(Amount,DateOfTransaction,EmployeeNumber)

--% We can drop a constraint as well
alter table tblemployees
drop constraint UNQGovernmentID


--% we can add it while creating the table as well
CREATE table tblName
(
    columnName varchar(20) NOT NULL,
    column2 BIGINT NULL,
    CONSTRAINT UNQName UNIQUE(columnName)
)

--% To modify a constraint, we cannot normally modify it, we need to drop it and create again

--!Deault Constraint
--* Inserts a default value while inserting new values
--https://docs.microsoft.com/en-us/sql/relational-databases/tables/specify-default-values-for-columns?view=sql-server-ver15
Alter TABLE tblName
Add constraint dfltColumn DEFAULT GETUTCDATE() for columnName
--+ To add a default to an existing column

CREATE table tblName
(
    columnName varchar(20) NOT NULL,
    column2 BIGINT NULL Constraint defaultConst Default getutcdate()
    --+ this will add default constraint
)

--% same constraint name cannot exist for different table
--% we cannot delete the column without deleting the constraint

--! Check constraint
--
--* can do check while inserting the data
alter table tblEmployee
add constraint chckAmount check(Amount > 0 and Amount <= 1000);
--+ if the column is nullable, we can still insert null

alter table tblEmployee
add constraint chckMiddleName check(Replace(middleName,'.','') = middleName or middleName is null);
--+ if there are already some records doesnt support this check, then creating of the constraint will fail
--+ To handle it, we need to add with nocheck after the table name.
alter table tblEmployee with nocheck
add constraint chckMiddleName check(Replace(middleName,'.','') = middleName or middleName is null);

CREATE table tblName
(
    columnName varchar(20) NOT NULL,
    column2 BIGINT NULL check(Replace(middleName,'.','') = middleName or middleName is null)
)
--% we can add it in normal way with specific name
CREATE table tblName
(
    columnName varchar(20) NOT NULL,
    column2 BIGINT NULL,
    Constraint chkMiddleName check(Replace(middleName,'.','') = middleName or middleName is null)
)
--* check constraints is for entire table
--! Primary key constraint
--* will not allow null, can created for multiple columns together. but only one constraint per table, creates a clustered index
--https://docs.microsoft.com/en-us/sql/relational-databases/tables/primary-and-foreign-key-constraints?view=sql-server-ver15
alter table tblemployees
Add constraint prmEmpID primary key(employeeNumber)
--% Identity
--* automatically order number, we cannot add to an existing table identity(startpoint, increment), we cannot explisitly insert value to an identity column, we cannot
CREATE TABLE tblEmployee
(
    [EmployeeNumber] [int] NOT NULL Constraint prmryEmpID Primary key Identity(1,1),
    [EmployeeFirstName] [varchar](50) NOT NULL,
)

--% to insert to identity column, we need to set the IDENTITY_INSERT to ON
set IDENTITY_INSERT tblEmployee ON
insert into tblEmployee
values(33, '');
set IDENTITY_INSERT tblEmployee OFF
--+ if we insert a record with identity insert on and after insert witout identity insert, then the value will start from the last value

select @@Identity
--+ returns the last identity
select @@SCOPE_IDENTITY
--+ returns the last identity

SELECT IDENT_CURRENT('dbo.tblEmployee')
--+ This will take a specific table, other two will do for last executed table

--!Cascade
--* can be used to update the foriegn columns if we change the parent table

--! Foriegn key
--* we need a a primary key or a unique key to do a foriegn key, foriegn key can be null
--% differnt operations while changing the value inside the parent table
--+ Not actoin
--+ cascade
--+ set null
--+ set default
Alter TABLE tblTransaction
Add constraint tblTransaction_tblEmployee foreign key(employeeNumber) references tblemployee(employeeNumber)
--% if someone update the primerry key in the relationship. we can use cascade or delete
Alter TABLE tblTransaction
Add constraint tblTransaction_tblEmployee foreign key(employeeNumber) references tblemployee(employeeNumber)
on update cascade  --+ we can give update set null or update set default or no action(no action will throw error?)
on delete cascade --+ we can give delete set null or delete set default or no action

--! View
--* we cannot use order by in views unless we have a top or offset in the query,there should be only one select statement in a view
go
create view vwName
as
    select employeeNumber
    from tblTransaction
go

create view vwName
as
    select top (100) percent
        employeeNumber
    --+ we can use percent in top statement
    from tblTransaction
go

--% To alter a view, use Alter keyword and to delete, use drop
--* we can use the sys.views to find the existing views in the DB
select *
from sys.views
--+ will give us all the information
select *
from information_schema.views
where table_schema = 'dbo' and table_name = 'name'
--+ this also works

--! exists
--* we can use if exists to check if there is an existing row
if exists (select *
from sys.views
where name ='name')
    drop view vwName
go
create view vwName
as
    select employeeNumber
    from tblTransaction
go

--% we can find the code of every views or stored procedure using sys.syscomments
select *
from sys.syscomments
--+ but we need the object id here

select a.text
from sys.syscomments a
    join sys.views b on a.id = b.object_id
where b.name = 'name'

--% another way to do it is
select object_definition(object_id('name'))
--+ here we need the object ID for that we can use object_id function
select *
from sys.sql_modules
--+ we can use this as well
--* we can use sp_helptext as well
exec sp_helptext 'name'
--% we can add security to the views, so nobody can view the details of it
go
create view vwName
with
    encryption
as
    --+ we can use encryption to make it encrypted, even we cannot see as well.
    select employeeNumber
    from tblTransaction
go

--+ if we doesnt have permission to tables but we have permissions to the views, then what it does is, it wil go to the view and if I have permission to the same schema(dbo)
--+ then the table will be accessible from the view even if there is no permission for the table. but if there are another table from another schema but doesnt have the permission
--+ then need to check for the permission to the specific schema

--* we cannot insert to multiple table using a insert view statement, we can only insert to a single table, same for update and delete
--% we can use the with check option to fail insert update or delete  operations for the records in the view

go
create view vwName
with
    encryption
as
    select employeeNumber
    from tblTransaction
with check option      --+ this will fail the update or insert operations for the records in the view
go

--! we cannot use outer joins(left and rigt) also count and order by in views(more as well), we need to use full tblname with schema(dbo.name)
--+ we can use OR Alter for atler the view if the view already exists.

--! Triggers
--https://docs.microsoft.com/en-us/sql/relational-databases/triggers/dml-triggers?view=sql-server-ver15
--* we can use insert snippet while right clicking and selecting insert snippet option in ssms
--% after trigger
create trigger tr_name
on tblTransaction
After insert, update, delete         --+ here we can mention the operation and when to initialize the trigger - this is a after trigger
as
 begin
    set nocount on;
--+ this will stop showing the no of row effected message
end
go
--% in trigger we have a special table called inserted and deleted,
create trigger tr_name
on tblTransaction
After insert, update, delete
as
 begin
    select *
    from inserte
    --+ we can use to see the inserted and deleted
    select *
    from deleted
end
go
--% instead of triggers
--* for instead of triggers we can only use any of insert, update, delete. we cannot do together, we need to write them seperately. but we can use together in after
create trigger tr_name
on vwName   --+ we can do triggers to views as well. it will work. even if the deletion doesnt work in the view, we can do operation under the table.even if there is a nocheck option in vie, yhis will work
instead of delete
as
begin
    select *
    from deleted
--+ here delete operation will not happen instead select will happen, even if it wont get deleted, still the data will be there in deleted table
end
go
--% we can set data to variable using a select statement
select @employeeNumber = employeeNumber, @employeeName = employeeName
from tblemployee
go
--* there miight be chance of one trigger triggers another one when the underlying table have another trigger
--% we can use @@NestLevel to know in which level the trigger is getting called. if the trigger is directly getting called, @@NestLevel will be 1. if another trigger
--% calls this trigger, then the level will be 2. we can put if condition to not run the trigger when the level is not 1, or we can do another operation, 32 is the maximum level
create trigger tr_name
on tblTransaction
After insert, update, delete
as
 begin
    if @@NestLevel = 1
    begin
        select *
        from inserte
        select *
        from deleted
    end
end
go

--% we can use @@Rowcount to determine find the number of rows effected

--% we can use update() function to see if there is any update is happened for a column
create trigger tr_name
on tblTransaction
After insert, update, delete
as
 begin
    if update(Amount)    --+ this will be successful only if the specified column is updated. not  changed the value, just updated
    begin
        select *
        from inserte
        select *
        from deleted
    end
end
go

--+ We can join with deleted table for deleting multiple records
--% Adding trigger on view and deleting the underlying table
create trigger tr_name
on vwName
After insert, update, delete
as
 begin
    select *, 'To be deleted' from deleted   --+ This will join with the deleted table. And we can delete all the matches record. If we use variables, Can we cannot delete all the files
    delete tbltransaction from tbltransaction T
    join deleted D on T.Amount = D.Amount
    and D.TransactionId = T.TransactionId
end
go

--! union
--+ union will add multiple rows together and result as a single output
--% there should be same number of columns in both rows
--% the columns should be of compartible type or same(int and bigint) or (varchar(2) and varchar(6))

--+ when combining 2 columns, the output will be of the biggest one, if we combine smallint ant bigint, output will be bigint. varchar(2) and varchar(6) will be varchar(6)
select convert(varchar(2),'hi')
union
select convert(varchar(6),'hello') --+ here the output will be hi and hello. but the output type will be varchar(6)
--+ column name are taken from first set of the data
--+there is no specific order.
select convert(varchar(2),'hi')
union
select convert(varchar(6),'hello')
union
select convert(varchar(6),'hi')  --+ here the output will be hi and hello. because union will not show the duplicates.
--% for that we need to use union all

select convert(varchar(2),'hi')
union
select convert(int,5) --+ here the output will be an error because botth are incompatible types
--https://docs.microsoft.com/en-us/sql/t-sql/language-elements/set-operators-union-transact-sql?view=sql-server-ver15
--! except
--* except will show the difference between the tables. it will take the first set of data and it will remove the second set of data from it(which is common.), and it will not consider the non matching record from the second set.
--* so common will be removed and extra rows from 2nd table will be removed

--! intersect
--* here it will take the common data from both

--% consider two datasets, first one is 1,2,3 and second one is 1,2,4
--+ union will output of 1,2,3,4(dups will not show)
--+ union all will be 1,2,3,1,2,4 (everything will be shown)
--+ except will be 3. (here it will copy the entire table and then which is 1,2,3 then it will take the second and remove common ones, so 1,2 is gone. it will not consider 4, because it is on 2nd dataset. so output will be 3)
--+ intersect will be 1,2 (here 1 and 2 is the common)
--https://docs.microsoft.com/en-us/sql/t-sql/language-elements/set-operators-except-and-intersect-transact-sql?view=sql-server-ver15
select *, row_number() over(order by(select null)) % 3 as ToBeDeleted
into tmpTransaction  --+ we are adding the values to a temp table, last column will be the remaining of row number/3
from tblTransaction
delete from tmpTransaction where ToBeDeleted =1
update tmpTransaction set DateOfTransaction = dateadd(day, 1, dateoftransaction)
where ToBeDeleted = 2
alter table tmpTransaction
drop column ToBeDeleted
--+ now some records are common, some are removed and some are changed

select * from tbltransaction
union
select * from tmpTransaction
--% here we get all without dupes
select * from tbltransaction
union all
select * from tmpTransaction
--% here we get everything with dupes
select * from tbltransaction
except
select * from tmpTransaction
--% here we get everything which is deleted as well as updated
select * from tbltransaction
intersect
select * from tmpTransaction
--% here we get everything which is same, not changed records

--* we should use order by at the end of the union

--! isnull
--% used to check the nullability and return another value if it is null
declare @name varchar(10) = 'Ans'
select isnull(@name, 'no name'); --+ if the @name became null, output will be no name
--! coalesce
--% use to check the nullability of multiple vslues one by one and return non nullable value
declare @name1 varchar(10) = 'ans'
declare @name varchar(10) = 'muhasin'
select COALESCE(@name1, @name2,'no name'); --+ if name1 nave proper value, output will be name1, if name1 is null, it will check name2, if it is not null,it will return it. and so on
--% the last item should be some value than null coalesce(null, null) will fail

--! Merge
--* we can insert update or delete the target table using the merge, if the condition exists.
--+ when matched AND something else then
--+ when matched
--+ when not matched by target Then (When not matched then)
--+ when not matched by source And something else Then
--+ when not matched by source Then

MERGE INTO tblTransaction AS T
USING tblTransactionNew AS S
ON T.TransactionId = S.TransactionId AND T.TransactionDate = S.TransactionDate
WHEN MATCHED THEN
    UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED BY TARGET THEN
    INSERT (TransactionID,TransactionDate, Amount)
    VALUES (S.TransactionId,S.TransactionDate, T.Amount)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE
OUTPUT Inserted.*, updated.*;    --+ obviously we can output it
--% we cannot update or delete the same target more than 1 time. There might be multiple  matching records in the Target table, so in that cae  we might need to group it and reduce the input data
GO
BEGIN TRAN
ALTER TABLE tblTransaction
ADD comment varchar(10);
go
MERGE INTO tblTransaction AS T
USING (SELECT TransactionId, TransactionDate , sum(Amount) as Amount FROM tblTransactionNew group by TransactionID, TransactionDate) as S
ON T.TransactionId = S.TransactionId AND T.TransactionDate = S.TransactionDate
WHEN MATCHED  AND Amount > 0 THEN                         --+ we can add extra conditions here
    UPDATE SET Amount = T.Amount + S.Amount, comment = 'Updated'
WHEN MATCHED THEN
DELETE
WHEN NOT MATCHED BY TARGET THEN
    INSERT (TransactionID,TransactionDate, Amount, comment)
    VALUES (S.TransactionId,S.TransactionDate, T.Amount, 'Inserted')
WHEN NOT MATCHED BY SOURCE THEN
    UPDATE SET Comment = 'No changed'
OUTPUT Inserted.*, updated.*, $action; --+ we can use this variable to see the action
Rollback tran

--! Stored procedure
--* we can use stored procedure to encapsulate the code
GO
CREATE PROC NameEmployee AS
BEGIN
    Select Name from tblemployee
END
--% How to call
execute NameEmployee
exec NameEmployee

go
NameEmployee;    --+ we can call the stored procedure with its came if the statement is at the beginning of the batch

--% we can find them by same as views
select * from sys.procedures where name = 'name'
select object_id('NameOfProcedure', 'P')

GO
create proc NameEmployee
(
    @ID int
)
AS
BEGIN
 Select Name from tblemployee where employeeNumber = @ID;
END

GO
create proc NameEmployee
(
    @IDFrom int,
    @IDTo int
)
AS
BEGIN
IF exists (select * from tblemployee where employeeNumber between @IDFrom and @IDTo)
 Select Name from tblemployee where employeeNumber between @IDFrom and @IDTo
END

exec NameEmployee 12,16;
exec NameEmployee @IDFrom = 12, @IDTo = 16;  --+ we can call the sp using the parameter name as well

--! While loop
GO
create proc NameEmployee
(
    @IDFrom int,
    @IDTo int
)
AS
BEGIN
IF exists (select * from tblemployee where employeeNumber between @IDFrom and @IDTo)
 declare @EmployeeNumber int = @IDFrom;
 while(@employeeNumber < @IDTo)
 BEGIN
    IF not exists (select * from tblemployee where employeeNumber = @employeeNumber)
    BEGIN
        SET @employeeNumber = @employeeNumber + 1
        CONTINUE;     --+ this will continue to the beginning, and will not execute other statements.
    END
    Select Name from tblemployee where employeeNumber between @IDFrom and @IDTo
    SET @employeeNumber = @employeeNumber + 1
    IF @EmployeeNumber = 500
        BREAK              --+ this will break the loop
    goto HelloWorld        --+ this will jump to HelloWorld statement
 END
 HelloWorld:
END
--+ here it will execute the statement multiple times

--! Output keyword
--* we can output a variable from the stored procedure
GO
create proc NameEmployee
(
    @IDFrom int,
    @IDTo int,
    @NumberOfRows int OUTPUT    --+ we need to mentoin a new variable as output. can use OUT as well
)
AS
BEGIN
IF exists (select * from tblemployee where employeeNumber between @IDFrom and @IDTo)
begin
 Select Name from tblemployee where employeeNumber between @IDFrom and @IDTo
SET @NumberOfRows = @@ROWCount;   --+ we can set the variable here
end
ELSE
set @NumberOfRows = 0;
end

declare @NumRows int
exec NameEmployee 12, 16, @NumRows
select @NumRows

--! Ruturn
--* we can use return statement to return the value. but we can only return 0 or 1. when return executed the SP will ends.
GO
create proc NameEmployee
(
    @IDFrom int,
    @IDTo int
)
AS
BEGIN
IF exists (select * from tblemployee where employeeNumber between @IDFrom and @IDTo)
begin
 Select Name from tblemployee where employeeNumber between @IDFrom and @IDTo
RETURN 1;  --+ it will return 1 if any row is executed
end
ELSE
RETURN 0;
end

exec NameEmployee 12, 16, @NumRows

--! try and catch
go
create proc NameEmployee
(
    @ID int
)
AS
BEGIN
begin try
 Select Name from tblemployee where employeeNumber = @ID;
end try
begin catch
SELECT ERROR_MESSAGE()          --+ This will give us the message, there are lot of other functions we can use which can be found under error_
return 0;
end catch
END
--+ error_severity shows the severity. 1-10 is warnings, it wont stop anything. 16 is default. 20-25 is really bad, which stop everything and close db. 26
--+ severity is bad at higher value
--+ error_line is the number of line

--! print
--+ we can print the values from the query
GO
create proc NameEmployee
(
    @ID int
)
AS
BEGIN
 print('started')
 Select Name from tblemployee where employeeNumber = @ID;
 print('finished')
END
go
--% tblAttendence
create table tblAttendance
(
    EmployeeNumber int,
    AttendanceMonth date,
    NumberAttendance smallint,
    CONSTRAINT PK_Attendance Primary key (EmployeeNumber, AttendanceMonth),
    CONSTRAINT FK_Attendance_EmployeeNumber FOREIGN KEY(EmployeeNumber)REFERENCES tblemployee(EmployeeNumber)
)
