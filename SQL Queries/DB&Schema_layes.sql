/*
# Creates Database and Schemas

By running this script you will be able to create a database named retail_dwh, if its not existing in your server,
if it already exists then creating database will be skipped

Additionally, three schemas like bronze, silver and gold following the medallion architecture for this 
data warehouse will be created if they are not existing in the database.

*/

-- Creating DB named retail_dwh
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'retail_dwh')
BEGIN
	CREATE DATABASE retail_dwh;
END
GO

USE retail_dwh;
GO

-- Creating Schemas for 3 layes of warehouse Bronze, Silver and Gold
-- Silver layer
IF NOT EXISTS (SELECT name FROM sys.schemas WHERE name = 'bronze')
BEGIN
	EXEC('CREATE SCHEMA bronze');
END
GO

-- Bronze layer
IF NOT EXISTS (SELECT name FROM sys.schemas WHERE name = 'silver')
BEGIN
	EXEC('CREATE SCHEMA silver');
END
GO 


-- Gold layer
IF NOT EXISTS (SELECT name FROM sys.schemas WHERE name = 'gold')
BEGIN
	EXEC('CREATE SCHEMA gold');
END
GO