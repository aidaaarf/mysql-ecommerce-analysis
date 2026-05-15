# Objective
# Prepare clean transaction data for retention analysis.
USE ecommerce_analysis;

WITH cleaned_orders AS (
    SELECT
        o.order_id,
        c.customer_unique_id,
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS order_month,
        o.order_purchase_timestamp,
        oi.price,
        oi.freight_value,
        (oi.price + oi.freight_value) AS total_order_value
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
)

SELECT *
FROM cleaned_orders;
