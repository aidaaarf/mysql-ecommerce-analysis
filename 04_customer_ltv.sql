# Business Question
# Which customers are the most valuable?

USE ecommerce_analysis;
WITH customer_revenue AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.price + oi.freight_value) AS total_revenue,
        AVG(oi.price + oi.freight_value) AS avg_order_value
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,
    total_orders,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(avg_order_value, 2) AS avg_order_value,
    CASE
        WHEN total_revenue >= 1000 THEN 'High Value'
        WHEN total_revenue >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_revenue
ORDER BY total_revenue DESC;
