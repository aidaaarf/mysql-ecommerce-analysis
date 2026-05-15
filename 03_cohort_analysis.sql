# Business Question
# How does retention behave across customer cohorts?

USE ecommerce_analysis;
WITH customer_first_purchase AS (
    SELECT
        c.customer_unique_id,
        MIN(DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01')) AS cohort_month
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
),

customer_orders AS (
    SELECT
        c.customer_unique_id,
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m-01') AS order_month
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
),

cohort_data AS (
    SELECT
        f.customer_unique_id,
        f.cohort_month,
        o.order_month,
        TIMESTAMPDIFF(
            MONTH,
            f.cohort_month,
            o.order_month
        ) AS cohort_index
    FROM customer_first_purchase f
    JOIN customer_orders o
        ON f.customer_unique_id = o.customer_unique_id
)

SELECT
    cohort_month,
    cohort_index,
    COUNT(DISTINCT customer_unique_id) AS customers
FROM cohort_data
GROUP BY cohort_month, cohort_index
ORDER BY cohort_month, cohort_index;