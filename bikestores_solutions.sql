-- ================================================================
-- BikeStores Database SQL Solutions
-- ================================================================

-- Problem 1: Total Bikes Sold
-- Create a view to list each bike name and the associated total quantity sold.
-- Then, query the view to show the top ten bikes sold in descending order.

CREATE VIEW TotalBikesSoldView AS
SELECT p.product_name, SUM(o.quantity) AS total_quantity_sold
FROM production.products p
JOIN sales.order_items o ON p.product_id = o.product_id
GROUP BY p.product_name;

-- Query to retrieve top ten bikes by total quantity sold
SELECT *
FROM TotalBikesSoldView
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Problem 2: Maximum Brand Bike Price
-- Create a view to list each bike brand and the associated maximum bike price.
-- Then, query the view to present the output in ascending order based on bike brand name.

CREATE VIEW MaximumBrandBikePriceView AS
SELECT b.brand_name, MAX(p.list_price) AS max_price
FROM production.brands b
JOIN production.products p ON b.brand_id = p.brand_id
GROUP BY b.brand_name;

-- Query to retrieve maximum bike prices for each brand
SELECT *
FROM MaximumBrandBikePriceView
ORDER BY brand_name ASC;

-- Problem 3: Average Brand Bike Price
-- Create a view to list each bike brand name and associated average bike list price and list price standard deviation.
-- Then, query the view and present the output in ascending order based on bike brand name.

CREATE VIEW AverageBrandBikePriceView AS
SELECT b.brand_name,
       AVG(p.list_price) AS avg_price,
       STDEV(p.list_price) AS price_stddev
FROM production.brands b
JOIN production.products p ON b.brand_id = p.brand_id
GROUP BY b.brand_name;

-- Query to retrieve average and standard deviation of bike prices for each brand
SELECT *
FROM AverageBrandBikePriceView
ORDER BY brand_name ASC;

-- Problem 4: Number of Customers Per State
-- Create a view to list the number of customers in each state.
-- The view needs to show the state name along with the customer amount.
-- Then, query the view and present the output in ascending order based on state.

CREATE VIEW NumberOfCustomersPerStateView AS
SELECT c.state, COUNT(c.customer_id) AS num_customers
FROM sales.customers c
GROUP BY c.state;

-- Query to retrieve the number of customers per state
SELECT *
FROM NumberOfCustomersPerStateView
ORDER BY state ASC;

-- Problem 5: Total Bikes Sold Per State
-- Create a view to show the cumulative bike sales per state.
-- The view needs to show the state name along with the bike sales quantity.
-- Then, query the view and present the output in ascending order based on state.

CREATE VIEW TotalBikesSoldPerStateView AS
SELECT c.state, SUM(o.quantity) AS total_bike_sales
FROM sales.customers c
JOIN sales.orders so ON c.customer_id = so.customer_id
JOIN sales.order_items o ON so.order_id = o.order_id
GROUP BY c.state;

-- Query to retrieve total bike sales per state
SELECT *
FROM TotalBikesSoldPerStateView
ORDER BY state ASC;

-- Problem 6: Get Store Brand Stock Quantity
-- Create a stored procedure to list the stock quantity at each store for a specified bike brand.
-- The results are presented in ascending order based on store name.

CREATE PROCEDURE GetStoreBrandStockQuantity
    @BrandName VARCHAR(255)
AS
BEGIN
    SELECT s.store_name, SUM(ps.quantity) AS stock_quantity
    FROM production.stocks ps
    JOIN sales.stores s ON ps.store_id = s.store_id
    JOIN production.products p ON ps.product_id = p.product_id
    JOIN production.brands b ON p.brand_id = b.brand_id
    WHERE b.brand_name = @BrandName
    GROUP BY s.store_name
    ORDER BY s.store_name ASC;
END;

-- To execute the procedure for 'Trek' bikes
-- EXEC GetStoreBrandStockQuantity @BrandName='Trek';

-- Problem 7: Get Brand List Price Statistics
-- Create a stored procedure to list the average, standard deviation, maximum, and minimum list prices for a specified bike brand.
-- The results are presented in ascending order based on store name.

CREATE PROCEDURE GetBrandListPriceStatistics
    @BrandName VARCHAR(255)
AS
BEGIN
    SELECT b.brand_name,
           AVG(p.list_price) AS avg_price,
           STDEV(p.list_price) AS price_stddev,
           MAX(p.list_price) AS max_price,
           MIN(p.list_price) AS min_price
    FROM production.brands b
    JOIN production.products p ON b.brand_id = p.brand_id
    WHERE b.brand_name = @BrandName
    GROUP BY b.brand_name;
END;

-- To execute the procedure for 'Trek' bikes
-- EXEC GetBrandListPriceStatistics @BrandName='Trek';

-- Problem 8: Get Bike Categories with Minimum Price Below Value
-- Create a stored procedure to list bike categories with minimum list prices below a specified value.
-- The results are presented in ascending order based on bike category.

CREATE PROCEDURE GetBikeCategoriesWithMinPriceBelowValue
    @Price DECIMAL(10,2)
AS
BEGIN
    SELECT c.category_name,
           MIN(p.list_price) AS min_price
    FROM production.categories c
    JOIN production.products p ON c.category_id = p.category_id
    GROUP BY c.category_name
    HAVING MIN(p.list_price) < @Price
    ORDER BY c.category_name ASC;
END;

-- To execute the procedure for minimum prices below $500
-- EXEC GetBikeCategoriesWithMinPriceBelowValue @Price=500;

-- Problem 9: Get Category Stock Quantity for Store
-- Create a stored procedure to list the stock quantity for each bike category at a specified store.
-- The results are presented in ascending order based on bike category.

CREATE PROCEDURE GetCategoryStockQuantityForStore
    @StoreName VARCHAR(255)
AS
BEGIN
    SELECT c.category_name,
           SUM(ps.quantity) AS stock_quantity
    FROM production.categories c
    JOIN production.products p ON c.category_id = p.category_id
    JOIN production.stocks ps ON p.product_id = ps.product_id
    JOIN sales.stores s ON ps.store_id = s.store_id
    WHERE s.store_name = @StoreName
    GROUP BY c.category_name
    ORDER BY c.category_name ASC;
END;

-- To execute the procedure for 'Santa Cruz Bikes' store
-- EXEC GetCategoryStockQuantityForStore @StoreName='Santa Cruz Bikes';

-- Problem 10: Get Brand Sales Discount Statistics
-
