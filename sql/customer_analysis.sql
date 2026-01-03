-- Orders per customer
-- Purpose: Classify customers into one-time vs repeat buyers

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id;


-- Revenue per customer
-- Purpose: Analyze revenue contribution by customer

SELECT
    c.customer_unique_id,
    COUNT(o.order_id) AS total_orders,
    SUM(oi.price + oi.freight_value) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id;
