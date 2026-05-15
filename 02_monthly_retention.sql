# Business Question
# How many customers return every month?

USE ecommerce_analysis;
WITH monthly_orders AS (
    SELECT
        c.customer_unique_id,
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS order_month
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
),

customer_activity AS (
    SELECT DISTINCT
        customer_unique_id,
        order_month
    FROM monthly_orders
),

retention_table AS (
    SELECT
        current_month.order_month AS current_month,
        COUNT(DISTINCT current_month.customer_unique_id) AS active_customers,
        COUNT(DISTINCT next_month.customer_unique_id) AS retained_customers
    FROM customer_activity current_month
    LEFT JOIN customer_activity next_month
        ON current_month.customer_unique_id = next_month.customer_unique_id
        AND next_month.order_month = DATE_FORMAT(
            DATE_ADD(current_month.order_month, INTERVAL 1 MONTH),
            '%Y-%m-01'
        )
    GROUP BY current_month.order_month
)

SELECT
    current_month,
    active_customers,
    retained_customers,
    ROUND(
        (retained_customers / active_customers) * 100,
        2
    ) AS retention_rate
FROM retention_table
ORDER BY current_month;
