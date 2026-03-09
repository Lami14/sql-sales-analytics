-- queries.sql
-- Total sales per month
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(p.price * oi.quantity) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- Top 3 customers by revenue
SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- Top-selling products
SELECT
    p.name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY revenue DESC;

-- Year-over-Year sales growth (example)
SELECT
    EXTRACT(YEAR FROM o.order_date) AS year,
    SUM(p.price * oi.quantity) AS total_sales,
    LAG(SUM(p.price * oi.quantity)) OVER (ORDER BY EXTRACT(YEAR FROM o.order_date)) AS prev_year_sales,
    ((SUM(p.price * oi.quantity) - LAG(SUM(p.price * oi.quantity)) OVER (ORDER BY EXTRACT(YEAR FROM o.order_date))) / LAG(SUM(p.price * oi.quantity)) OVER (ORDER BY EXTRACT(YEAR FROM o.order_date))) * 100 AS yoy_growth
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY year
ORDER BY year;
