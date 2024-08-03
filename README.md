# BikeStores Database Views and Stored Procedures

## Project Overview

This project involves creating various SQL views and stored procedures to manage and retrieve data efficiently from the BikeStores database. Each problem statement describes a task to be accomplished using SQL views and stored procedures. The expected output section provides a description of the result you should expect from each solution.

## Problems and Solutions

### Problem 1: Total Bikes Sold

**Problem Statement:**
Establish a database view called `TotalBikesSoldView` that lists each bike name and the associated total quantity sold. Then query the view to show the top ten bikes sold. Present the output in descending order based on total bikes sold.

**Solution:**
Create the view `TotalBikesSoldView` and query it to retrieve the top ten bikes by total quantity sold.

**Expected Output:**
- Bike name
- Total quantity sold
- Sorted in descending order by total quantity sold

---

### Problem 2: Maximum Brand Bike Price

**Problem Statement:**
Establish a database view called `MaximumBrandBikePriceView` that lists each bike brand and the associated maximum bike price. Then query the view and present the output in ascending order based on bike brand name.

**Solution:**
Create the view `MaximumBrandBikePriceView` and query it to retrieve the maximum price for each bike brand, sorted alphabetically by brand name.

**Expected Output:**
- Bike brand name
- Maximum bike price
- Sorted in ascending order by bike brand name

---

### Problem 3: Average Brand Bike Price

**Problem Statement:**
Establish a database view called `AverageBrandBikePriceView` that lists each bike brand name and the associated average bike list price and list price standard deviation. Then query the view and present the output in ascending order based on bike brand name.

**Solution:**
Create the view `AverageBrandBikePriceView` and query it to retrieve the average and standard deviation of bike prices for each brand, sorted alphabetically by brand name.

**Expected Output:**
- Bike brand name
- Average list price
- List price standard deviation
- Sorted in ascending order by bike brand name

---

### Problem 4: Number of Customers Per State

**Problem Statement:**
Establish a database view called `NumberOfCustomersPerStateView` that lists the number of customers in each state. The view needs to show the state name along with the customer count. Then query the view and present the output in ascending order based on state.

**Solution:**
Create the view `NumberOfCustomersPerStateView` and query it to retrieve the number of customers per state, sorted alphabetically by state name.

**Expected Output:**
- State name
- Number of customers
- Sorted in ascending order by state name

---

### Problem 5: Total Bikes Sold Per State

**Problem Statement:**
Establish a database view called `TotalBikesSoldPerStateView` that shows the cumulative bike sales per state. The view needs to show the state name along with the bike sales quantity. Then query the view and present the output in ascending order based on state.

**Solution:**
Create the view `TotalBikesSoldPerStateView` and query it to retrieve cumulative bike sales by state, sorted alphabetically by state name.

**Expected Output:**
- State name
- Total bike sales quantity
- Sorted in ascending order by state name

---

### Problem 6: Stock Quantity by Store and Brand

**Problem Statement:**
Create a stored procedure that lists the stock quantity at each store for a specified bike brand. The output must show the store name and stock quantity value. The results need to be presented in ascending order based on store name.

**Solution:**
Create the stored procedure `GetStoreBrandStockQuantity` and execute it to retrieve the stock quantity for a specified bike brand, sorted alphabetically by store name.

**Expected Output:**
- Store name
- Stock quantity
- Sorted in ascending order by store name

---

### Problem 7: Brand List Price Statistics

**Problem Statement:**
Create a stored procedure that lists the average, standard deviation, maximum, and minimum list prices for a specified bike brand. The output must show the brand name along with the aggregated results. The results need to be presented in ascending order based on store name.

**Solution:**
Create the stored procedure `GetBrandListPriceStatistics` and execute it to retrieve average, standard deviation, maximum, and minimum list prices for a specified bike brand.

**Expected Output:**
- Brand name
- Average list price
- Standard deviation
- Maximum list price
- Minimum list price

---

### Problem 8: Bike Categories with Minimum Price Below Value

**Problem Statement:**
Create a stored procedure that lists the bike categories with minimum list prices below a specified value. The output must show the bike category and associated minimum list price. The results need to be presented in ascending order based on bike category.

**Solution:**
Create the stored procedure `GetBikeCategoriesWithMinPriceBelowValue` and execute it to retrieve bike categories where the minimum list price is below the specified value, sorted alphabetically by bike category.

**Expected Output:**
- Bike category name
- Minimum list price
- Sorted in ascending order by bike category

---

### Problem 9: Category Stock Quantity for Store

**Problem Statement:**
Create a stored procedure that lists the stock quantity for each bike category at a specified store. The output must show the bike category and stock quantity value. The results need to be presented in ascending order based on bike category.

**Solution:**
Create the stored procedure `GetCategoryStockQuantityForStore` and execute it to retrieve stock quantities for each bike category at a specified store, sorted alphabetically by bike category.

**Expected Output:**
- Bike category name
- Stock quantity
- Sorted in ascending order by bike category

---

### Problem 10: Brand Sales Discount Statistics

**Problem Statement:**
Create a stored procedure that presents the sales discount average and standard deviation for bike brands at or above a specified discount value. The output must show the brand names in alphabetical order along with the associated statistics.

**Solution:**
Create the stored procedure `GetBrandAverageSalesDiscountAboveValue` and execute it to retrieve the average and standard deviation of sales discounts for bike brands with discounts at or above a specified value, sorted alphabetically by brand name.

**Expected Output:**
- Brand name
- Average sales discount
- Standard deviation of sales discount
- Sorted in alphabetical order by brand name
