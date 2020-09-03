--* Install developer version for all the features for free, but it cannot be used in production. Enterprice and standard is paid. free version is  express but it lack lot of features. so better download developer for learning and testing.
--* install SQL server as well as sql server management studio

SELECT 1 + 1;
-- we can directly use select like this
SELECT 1 + 1 AS Result; -- so the output column will be typed as output column
GO
--* GO signals the end of a batch of Transact-SQL statements to the SQL Server utilities.
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

--! string fnctions
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
Select Convert(vdatetime2,'2020-08-02 12:45:33.1234567' );
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
where firstName =  '';
select *
from tblName
where firstName <> '';  --+ <> stands for not equals






















