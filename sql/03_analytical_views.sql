-- Analytical views used for Power BI dashboard

-- Category performance view
CREATE VIEW category_performance AS
SELECT
    category,
    SUM(sales)  AS total_sales,
    SUM(profit) AS total_profit
FROM orders
GROUP BY category;



-- Loss-making sub-categories view
CREATE VIEW loss_analysis AS
SELECT
    sub_category,
    SUM(profit) AS total_profit
FROM orders
GROUP BY sub_category
HAVING total_profit < 0;



-- Sales trend view
CREATE VIEW sales_trend_final AS
SELECT
    YEAR(order_date)  AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales)        AS total_sales
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date);


