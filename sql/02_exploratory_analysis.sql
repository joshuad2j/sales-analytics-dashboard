-- Exploratory analysis queries
-- Total sales by category
-- to identify which category made how much revenue
SELECT
    category,
    SUM(sales) AS total_sales
FROM orders
GROUP BY category;  


-- Loss-making sub-categories -- to identify the loss
SELECT
    sub_category,
    SUM(profit) AS total_profit
FROM orders
GROUP BY sub_category
HAVING total_profit < 0;


-- Monthly sales trend
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales) AS total_sales
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;


-- Top 5 profit products
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM orders
GROUP BY product_name
HAVING total_profit > 0
ORDER BY total_profit DESC
LIMIT 5;


-- Top 5 loss products 
SELECT
    product_name,
    SUM(profit) AS total_loss
FROM orders
GROUP BY product_name
HAVING total_loss < 0
ORDER BY total_loss ASC
LIMIT 5; 
