-- Use database
create database superstore_sales;
use superstore_sales;
INSERT INTO orders
SELECT
    Order_id,
    STR_TO_DATE(Order_date, '%c/%e/%Y'),
    Customer_ID,
    Country,
    City,
    State,
    Region,
    Product_ID,
    Category,
    Sub_category,
    Product_name,
    CAST(Sales AS DECIMAL(10,2)),
    CAST(Quantity AS SIGNED),
    CAST(Discount AS DECIMAL(5,2)),
    CAST(Profit AS DECIMAL(10,2))
FROM orders_temp;

-- Load raw CSV data into staging table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/project1.csv' -- this is to load the local file path of the file that we require
INTO TABLE orders_temp
FIELDS TERMINATED BY ',' -- mentioned the delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Adjust text column sizes
ALTER TABLE orders
MODIFY Country VARCHAR(100),
MODIFY City VARCHAR(100),
MODIFY State VARCHAR(100),
MODIFY Category VARCHAR(100),
MODIFY Sub_category VARCHAR(100),
MODIFY Product_name VARCHAR(255);

-- Validate missing values
SELECT *
FROM orders
WHERE Sales IS NULL
OR Profit IS NULL
OR Quantity IS NULL;



