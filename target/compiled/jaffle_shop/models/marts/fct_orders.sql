WITH orders AS(
    SELECT *
    FROM `dbt-day`.`dbt_lisa`.`stg_orders`
),

payments AS (
    SELECT *
    FROM `dbt-day`.`dbt_lisa`.`stg_payments`
),

order_payments AS(
    SELECT order_id,
           SUM(amount_cents) AS total_amount_cents
    FROM payments
    GROUP BY order_id
),

final AS (
    SELECT o.order_id,
           o.customer_id,
           o.order_date,
           o.status,
           COALESCE(total_amount_cents, 0) AS amount_cents
    FROM orders AS o
    LEFT JOIN order_payments AS op ON o.order_id = op.order_id
)

SELECT *
FROM final