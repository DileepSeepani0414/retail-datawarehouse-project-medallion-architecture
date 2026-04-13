USE retail_dwh;
GO

-- Exact Duplicates Check in raw customers table
SELECT COUNT(*) AS customers_dup_count
FROM (
	SELECT customer_id, name, city, updated_at, COUNT(*) AS Count
	FROM bronze.customers
	GROUP BY customer_id, name, city, updated_at
	HAVING COUNT(*) > 1
) t;
-- 218 Duplicates found in customers table


-- Absolute duplicates in raw customers table
SELECT customer_id, COUNT(*) AS Count
FROM bronze.customers
GROUP BY customer_id
HAVING COUNT(*) > 1;
-- Duplicates found in customer_id which may be updates in custumer details(SCD's)


-- Duplicates Check in raw orders table
SELECT COUNT(*) AS orders_dup_count
FROM (
	SELECT order_id, customer_id, product_id, order_date, quantity, amount, COUNT(*) AS count
	FROM bronze.orders
	GROUP BY order_id, customer_id, product_id, order_date, quantity, amount
	HAVING COUNT(*) > 1
) t1;
-- No duplicates found in orders table


-- Duplicates Check in raw products table
SELECT COUNT(*) AS products_dup_count
FROM (
	SELECT product_id, product_name, category, price, COUNT(*) AS Count
	FROM bronze.products
	GROUP BY product_id, product_name, category, price
	HAVING COUNT(*) > 1
	) t;

-- Missing value or NULL detection in customers table
SELECT
		SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS cust_id_nulls,
		SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name_nulls,
		SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS city_nulls,
		SUM(CASE WHEN updated_at IS NULL THEN 1 ELSE 0 END) AS update_nulls
FROM bronze.customers;
/*
city column - 119 Nulls
updated_at column - 363 Nulls
*/

-- Missing value or NULL detection in orders table
SELECT
		SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_nulls,
		SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS cust_id_nulls,
		SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS prod_nulls,
		SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS ord_date_nulls,
		SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS quant_nulls,
		SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS amnt_nulls
FROM bronze.orders;
/*
order_date - 995 Nulls
amount - 979 Nulls
*/


-- Missing value or NULL detection in orders table
SELECT
		SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS prod_id_nulls,
		SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS prod_name_nulls,
		SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS cat_nulls,
		SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS prc_nulls
FROM bronze.products;
-- No null values in orders table