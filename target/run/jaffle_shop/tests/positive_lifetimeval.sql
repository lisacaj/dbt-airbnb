
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT customer_id,
       life_time_value
FROM `dbt-day`.`dbt_lisa`.`dim_customers`
WHERE life_time_value < 0
  
  
      
    ) dbt_internal_test