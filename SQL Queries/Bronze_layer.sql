/*
# Creating tables and bulk inserting data into tables

By ececuting this script you will be able to create the tables and data from the source csv files will be bulk
inserted into the tables in bronze layer

Data will be loaded by truncating the existing data in tables and fill be bulk inserted.

NOTE: Before execute check and change the path of the source file (here it is CSV)
*/

USE retail_dwh;
GO

-- Creating Tables for Raw Data in Bronze Layer
-- customers table
IF OBJECT_ID('bronze.customers', 'U') IS NULL
BEGIN
	CREATE TABLE bronze.customers(
		customer_id INT,
		name NVARCHAR(50),
		city NVARCHAR(50),
		updated_at VARCHAR(50)
		);
END
GO

-- products table
IF OBJECT_ID('bronze.products', 'U') IS NULL
BEGIN
	CREATE TABLE bronze.products(
		product_id INT,
		product_name NVARCHAR(50),
		category NVARCHAR(50),
		price DECIMAL(10,2)
		);
END
GO

-- orders table
IF OBJECT_ID('bronze.orders', 'U') IS NULL
BEGIN
	CREATE TABLE bronze.orders(
		order_id INT,
		customer_id INT,
		product_id INT,
		order_date VARCHAR(50),
		quantity INT,
		amount DECIMAL(10,2)
		);
END
GO


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	-- Inserting Data into Tables
	-- insert into bronze.customers (full load)
	TRUNCATE TABLE bronze.customers;
	BULK INSERT bronze.customers
	FROM 'C:\Dileep Seepani\Projects\DataWarehouse Project\Dataset\customers.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
	);

	-- insert into bronze.products (full load)
	TRUNCATE TABLE bronze.products
	BULK INSERT bronze.products
	FROM 'C:\Dileep Seepani\Projects\DataWarehouse Project\Dataset\products.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);

	-- insert into bronze.orders (full load)
	TRUNCATE TABLE bronze.orders
	BULK INSERT bronze.orders
	FROM 'C:\Dileep Seepani\Projects\DataWarehouse Project\Dataset\orders.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '\n',
		TABLOCK
		);
END