-- CREATE DATABASE
CREATE DATABASE retail_sales;
USE retail_sales;

-- CREATE TABLE
CREATE TABLE superstore (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code INT,
    Region VARCHAR(50),
    Product_ID VARCHAR(100),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(10,2),
    Profit DECIMAL(10,2)
);

-- LOAD DATA (Example, adjust path)
-- Make sure your CSV is correctly placed.

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- BASIC ANALYSIS QUERIES

-- 1. Total Sales
SELECT SUM(Sales) AS Total_Sales FROM superstore;

-- 2. Total Profit
SELECT SUM(Profit) AS Total_Profit FROM superstore;

-- 3. Profit Margin
SELECT (SUM(Profit)/SUM(Sales)) * 100 AS Profit_Margin FROM superstore;

-- 4. Sales by Category
SELECT Category, SUM(Sales) AS Sales
FROM superstore
GROUP BY Category;

-- 5. Monthly Sales Trend
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, SUM(Sales)
FROM superstore
GROUP BY Month;

-- 6. Profit by Region
SELECT Region, SUM(Profit)
FROM superstore
GROUP BY Region;

-- 7. Discount vs Profit
SELECT Discount, Profit FROM superstore;

-- 8. Top 10 Products by Sales
SELECT Product_Name, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Sales by State (Used for Map Visual)
SELECT State, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY State;

-- 10. Customer Segment Performance
SELECT Segment, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Segment
ORDER BY Total_Sales DESC;