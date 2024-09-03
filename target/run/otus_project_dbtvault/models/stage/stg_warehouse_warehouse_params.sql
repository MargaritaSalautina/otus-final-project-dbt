
  create view "postgres"."dbt"."stg_warehouse_warehouse_params__dbt_tmp" as (
    with stg_warehouse as (
    select WAREHOUSE_KEY, WAREHOUSE_PK, id from "postgres"."dbt"."stg_warehouse"
),

stg_warehouse_params as (
    select WAREHOUSE_PARAMS_KEY, WAREHOUSE_PARAMS_PK, warehouse_id from "postgres"."dbt"."stg_warehouse_params"
)

select  WAREHOUSE_KEY, WAREHOUSE_PARAMS_KEY, WAREHOUSE_PK, WAREHOUSE_PARAMS_PK from stg_warehouse w
JOIN stg_warehouse_params wp ON wp.warehouse_id = w.id
  );