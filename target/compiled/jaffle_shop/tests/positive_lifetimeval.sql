SELECT customer_id,
       life_time_value
FROM `dbt-day`.`dbt_lisa`.`dim_customers`
WHERE life_time_value < 0