# Business Question
# How quickly do customers place a second order?

USE ecommerce_analysis;
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        o.order_purchase_timestamp,

        ROW_NUMBER() OVER (
            PARTITION BY c.customer_unique_id
            ORDER BY o.order_purchase_timestamp
        ) AS order_number,

        LAG(o.order_purchase_timestamp) OVER (
            PARTITION BY c.customer_unique_id
            ORDER BY o.order_purchase_timestamp
        ) AS previous_order_date

    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
)

SELECT
    customer_unique_id,
    order_number,
    order_purchase_timestamp,
    previous_order_date,

    DATEDIFF(
        order_purchase_timestamp,
        previous_order_date
    ) AS days_between_orders

FROM customer_orders
WHERE previous_order_date IS NOT NULL;