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

-- SELECT TOP 5
--         PP.FirstName, PA.City, PA.PostalCode, PA.AddressLine1
-- FROM Person.Person AS PP
--     INNER JOIN Person.Address AS PA
--             ON PP.BusinessEntityID = PA.AddressID
--     INNER JOIN Person.CountryRegion AS PC
--             ON PP.FirstName = PC.Name;

-- select * from [Person].[CountryRegion]
-- WHERE [Name] = 'Jordan';
-- select * from [Person].[Person];

------------------LEFT JOIN-----------------

-- SELECT top 5 SP.BusinessEntityID AS 'person id', SC.CardNumber AS 'cards', SC.CardType AS 'type' FROM Sales.CreditCard as SC
--     left JOIN Sales.PersonCreditCard as SP
--             ON SP.CreditCardID = SC.CreditCardID;

-- SELECT top 5 * FROM Sales.PersonCreditCard;

-- SELECT  DISTINCT CardType FROM Sales.CreditCard AS SC;
-- WHERE SC.CardType =  'Distinguish';

-- SELECT  SCU.AccountNumber, SC.CardNumber FROM Sales.Customer AS SCU
--     LEFT JOIN Sales.CreditCard AS SC
--             ON  SC.CardNumber = SCU.AccountNumber
-- WHERE CardNumber IS NOT NULL;

-- SELECT DISTINCT top 5 * FROM Sales.SalesOrderDetail where ProductID = 316;
-- SELECT DISTINCT top 5 * FROM Production.Product;

-- SELECT SS.Name,SS.SalesPersonID FROM Sales.Store AS SS 
--     LEFT JOIN Sales.SalesPerson AS SSP
--             ON  SS.SalesPersonID = SSP.BusinessEntityID;

-- SELECT TOP 5 * FROM Sales.SalesPerson;

--------------------RIGHT JOIN---------------------
-- SELECT * FROM Sales.Store AS SS 
--     INNER JOIN Sales.SalesPerson AS SSP
--             ON  SS.SalesPersonID = SSP.BusinessEntityID;

-- SELECT * FROM Sales.Store, Sales.SalesPerson; une las dos tablas


-------------------FULL OUTER JOIN--------------------

-- SELECT TOP 50 SS.ModifiedDate AS 'SS' ,SSP.ModifiedDate AS 'SSP', SS.Name, SS.SalesPersonID, SSP.BusinessEntityID FROM Sales.Store AS SS 
--     FULL OUTER JOIN Sales.SalesPerson AS SSP
--             ON SS.ModifiedDate = SSP.ModifiedDate
-- WHERE SS.ModifiedDate BETWEEN  '2005-02-21 00:00:00.000' AND '2015-02-21 00:00:00.000';

-------------------SELFT JOIN---------------------

-- SELECT TOP 5 * FROM Person.Person;

-- SELECT TOP 10 A.FirstName AS '#1', B.FirstName AS 'B-NAME', B.LastName AS '#2'
-- FROM Person.Person AS A, Person.Person AS B
-- WHERE A.BusinessEntityID = B.BusinessEntityID 
--     AND B.Title IS NOT NULL
-- ORDER BY A.ModifiedDate DESC;


----------------------UNION OPERATOR ---------------
SELECT TOP 5 FirstName FROM Person.Person
UNION
SELECT TOP 5 EmailAddress FROM Person.EmailAddress;
