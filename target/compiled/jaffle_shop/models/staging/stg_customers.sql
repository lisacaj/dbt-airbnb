WITH source AS (
    SELECT *
    FROM `dbt-day`.`dbt_lisa`.`raw_customers` 
), 

renamed AS (
    SELECT id AS customer_id,
           first_name,
           last_name
    FROM source
)

SELECT *
FROM renamed