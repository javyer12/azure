-- SELECT TOP (10) [BusinessEntityID]
--       ,[Name]
--       ,[Demographics]
--   FROM [AdventureWorks2019].[Sales].[Store];


-- Select [Name] from [AdventureWorks2019].[Sales].[Store];

-- select  top(5) [FirstName],[ModifiedDate] 
-- AS 'newest' 
-- from [AdventureWorks2019].[Person].[Person]
-- WHERE [ModifiedDate] > '2009-02-21 00:00:00.000';

-- 2009-04-26 00:00:00.000
-- 2009-02-21 00:00:00.000

-- SELECT top(10) [FirstName], [Title], [PersonType]
-- from [AdventureWorks2019].[Person].[Person]
-- ORDER BY [Suffix] ASC,[BusinessEntityID] DESC;


-- Insert into [AdventureWorks2019].[Production].[Culture]
-- values ('2', 'julian-alvarez-erez', '2009-02-21 00:00:00.000');

-- Insert into [AdventureWorks2019].[Production].[Culture] ([CultureID], [Name])
-- values ( '5', 'jel Joan Laporta');

-- SELECT top(10) [Name], [ModifiedDate] from  [AdventureWorks2019].[Production].[Culture];

-- SELECT Count([FirstName])
-- from [AdventureWorks2019].[Person].[Person]
-- WHERE [Title] is not null and [PersonType] is not null;

-- UPDATE [AdventureWorks2019].[Production].[Culture]
-- SET [Name] = 'Leonel Messi'
-- where [CultureID] = 'fr';

-- DELETE FROM [AdventureWorks2019].[Production].[Culture]
-- where [CultureID] = '1';

-- SELECT top(3) * from  [AdventureWorks2019].[Production].[Culture]

-- select min([VacationHours]) from [AdventureWorks2019].[HumanResources].[Employee]
-- select max([VacationHours]) from [AdventureWorks2019].[HumanResources].[Employee]
-- where [JobTitle] = 'Marketing Assistant'

-- SELECT *
-- FROM [AdventureWorks2019].[Person].[Person]
-- where [FirstName] like '%anyLetterOrWord' returns a specified letter or word at the end
-- where [FirstName] like 'anyLetterOrWord%' returns a specified letter o word at the beggining
-- where [FirstName] like 'e__%' returns records where it starts with e and it is at least 3chart in length
-- where [FirstName] like 'e__%'
--     AND [PersonType] = 'SC'
--     AND [BusinessEntityID] > 300;

-- SELECT *
-- FROM [AdventureWorks2019].[Person].[Person]
-- where [FirstName] like '[jab]%';returns all records whose firstname starts with 'j', 'a' or 'b'
-- where [FirstName] like '[a-f]%'; returns records whose name starts from a to f

-- where [FirstName] not like '[a]%';

-- ---------IN OPERATOR-----------shorthand for "or" operator

-- SELECT COUNT(*) AS 'TOTAL OF PERSONS' FROM [AdventureWorks2019].[Person].[Person];

-- SELECT * FROM [AdventureWorks2019].[Person].[Person]
-- where [FirstName] in ('Jennifer', 'Ana', 'Eric') and  [FirstName] not in ('Jennifer', 'Ana', 'Eric');

-- SELECT count(*) AS 'REST' FROM [AdventureWorks2019].[Person].[Person]
-- where [FirstName] not in ('Jennifer', 'Ana', 'Eric');


-- --------------BETWEEN operator------------

-- SELECT top(30)
--     *
-- FROM [AdventureWorks2019].[Person].[Person]
-- where [BusinessEntityID] not BETWEEN 10 and 50 and [Title] is not null
-- ORDER BY [BusinessEntityID] DESC;


-- SELECT [FirstName] as 'lastPerson'
-- FROM [AdventureWorks2019].[Person].[Person]
-- where [BusinessEntityID] = '20702';


-- SELECT [FirstName] as 'latestDates' FROM [AdventureWorks2019].[Person].[Person]
-- WHERE [ModifiedDate] BETWEEN  '1996-07-01' AND '2016-07-31';


------------------------INNER JOIN--------------------

-- SELECT * FROM [AdventureWorks2019].[Sales].[Store];

-- SELECT top(5) * FROM [AdventureWorks2019].[Person].[Password];
-- SELECT top(5) * FROM [AdventureWorks2019].[Person].[Person];
use [AdventureWorks2019];

-- SELECT top(5)
--     [PasswordHash], PE.[FirstName], PE.ModifiedDate as 'PersonDate', PM.EmailAddress
-- FROM [Person].[Password] as PA
--     INNER JOIN [Person].[Person] as PE
--             ON PA.BusinessEntityID = PE.BusinessEntityID
--     INNER JOIN [Person].[EmailAddress] AS PM
--             ON PM.BusinessEntityID = PA.BusinessEntityID
-- ORDER BY PE.ModifiedDate DESC;

-- SELECT TOP(5)
--         PP.FirstName, PA.City, PA.PostalCode, PA.AddressLine1
-- FROM [Person].[Person] AS PP
--     INNER JOIN [Person].[Address] AS PA
--             ON PP.BusinessEntityID = PA.AddressID
--     INNER JOIN [Person].[CountryRegion] AS PC
--             ON PP.FirstName = PC.Name;

-- select * from [Person].[CountryRegion]
-- WHERE [Name] = 'Jordan';
-- select * from [Person].[Person];
