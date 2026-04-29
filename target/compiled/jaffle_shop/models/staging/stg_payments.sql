WITH source AS (
    SELECT *
    FROM `dbt-day`.`dbt_lisa`.`raw_payments` 
), 

renamed AS (
    SELECT id AS payment_id,
           order_id, 
           payment_method,
           amount AS amount_cents
    FROM source
)

SELECT *
FROM renamed