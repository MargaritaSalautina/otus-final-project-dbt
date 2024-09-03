
  create view "postgres"."dbt"."stg_warehouse_address_city__dbt_tmp" as (
    with stg_city as (
    select CITY_KEY, CITY_PK, id from "postgres"."dbt"."stg_city"
),

stg_warehouse_address as (
    select WAREHOUSE_ADDRESS_KEY, WAREHOUSE_ADDRESS_PK, city_id from "postgres"."dbt"."stg_warehouse_address"
)

select  WAREHOUSE_ADDRESS_KEY, CITY_KEY, WAREHOUSE_ADDRESS_PK, CITY_PK from stg_city sc
JOIN stg_warehouse_address swa ON sc.id = swa.city_id
  );