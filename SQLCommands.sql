--* Install developer version for all the features for free, but it cannot be used in production. Enterprice and standard is pain. free version is  express but it lack lot of features. so better download developer for learning and testing.
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
Values(1);
--! To refresh  intellisense go to edit, intellisense,refresh local cache (cntrl + shift + R)

SELECT column_name
FROM tblName
DELETE FROM tblName
--for deleting data from the table
TRUNCATE TABLE tblName
-- for deleting the entire data
DROP TABLE tblName
-- fror deleting the table
--+ delete can roll back, truncate cannot
--+ truncate reset the identity, delete wont
--+ we can delete specific data using truncate

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
--+ Decimal ans numeric are almost same
--+ Decimal(precision, scale) DECIMAL(Howmany total numbers can it have, what is the number after the point)
--+ DECIMAL(5,2) 12345.12 is valid and 123456.1 is not valid
--+ Dont give default value for decimal, it is a huge value and it takes nine bites == Decimal(18,8)
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
-- (input as expected type)
--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15

--! string
--* char          ASCII system, which have only english and the maximum number range is 55, 1byte
--* varchar       ASCII system, which have only english and the maximum number range is 55, 1byte for a charector
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