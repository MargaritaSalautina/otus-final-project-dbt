
  create view "postgres"."dbt"."cv_warehouse__dbt_tmp" as (
    select
    sw.WAREHOUSE_PK,
    sw.name,
    sw.system_name,
    swp.max_loading_weight,
    swp.max_loading_volume,
    wac.CITY_PK
FROM "postgres"."dbt"."sat_warehouse" AS sw
LEFT JOIN "postgres"."dbt"."link_warehouse_warehouse_params" AS wp on sw.WAREHOUSE_PK = wp.WAREHOUSE_PK
LEFT JOIN "postgres"."dbt"."link_warehouse_address_warehouse_params" AS wa ON wa.WAREHOUSE_PARAMS_PK = wp.WAREHOUSE_PARAMS_PK
LEFT JOIN "postgres"."dbt"."sat_warehouse_params" AS swp ON swp.WAREHOUSE_PARAMS_PK = wp.WAREHOUSE_PARAMS_PK
LEFT JOIN "postgres"."dbt"."link_warehouse_address_city" AS wac ON wac.WAREHOUSE_ADDRESS_PK = wa.WAREHOUSE_ADDRESS_PK
  );