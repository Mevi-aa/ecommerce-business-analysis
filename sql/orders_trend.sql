-- Monthly delivered order volume trend
-- Purpose: Analyze how order demand changes over time

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS order_month,
    COUNT(order_id) AS delivered_orders
FROM orders
WHERE order_status = 'delivered'
GROUP BY order_month
ORDER BY order_month;