WITH customers AS(
    SELECT *
    FROM `dbt-day`.`dbt_lisa`.`stg_customers`
),

orders AS (
    SELECT *
    FROM `dbt-day`.`dbt_lisa`.`fct_orders`
),

customer_orders AS(
    SELECT customer_id,
           COUNT(order_id) AS orders,
           MIN(order_date) AS min_order_date,
           MAX(order_date) AS max_order_date,
           SUM(amount_cents)/100 AS life_time_value
    FROM orders
    GROUP BY customer_id
),

final AS(
    SELECT c.customer_id,
           c.first_name,
           c.last_name,
           COALESCE(orders, 0) AS number_of_orders,
           co.min_order_date,
           co.max_order_date,
           COALESCE(life_time_value, 0) AS life_time_value
    FROM customers AS c 
    LEFT JOIN customer_orders AS co ON c.customer_id = co.customer_id
)

SELECT *
FROM final