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