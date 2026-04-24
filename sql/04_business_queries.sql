-- Business-oriented analysis queries

-- Top 5 loss-driving products
SELECT
    product_name,
    SUM(profit) AS total_loss
FROM orders
GROUP BY product_name
HAVING total_loss < 0
ORDER BY total_loss ASC
LIMIT 5;



-- Top 5 profit-generating products
SELECT
    product_name,
    SUM(profit) AS total_profit
FROM orders
GROUP BY product_name
HAVING total_profit > 0
ORDER BY total_profit DESC
LIMIT 5;



-- Profit margin by category
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin_pct
FROM orders
GROUP BY category;
