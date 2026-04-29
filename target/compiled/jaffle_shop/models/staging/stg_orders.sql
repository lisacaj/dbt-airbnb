WITH source AS (
    SELECT *
    FROM `dbt-day`.`dbt_lisa`.`raw_orders` 
), 

renamed AS (
    SELECT id AS order_id,
           user_id AS customer_id,
           order_date,
           status
    FROM source
)

SELECT *
FROM renamed