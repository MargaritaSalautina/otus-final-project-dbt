
  create view "postgres"."dbt"."d_order_status__dbt_tmp" as (
    select
    sc.ORDER_STATUS_PK,
    sc.name
FROM "postgres"."dbt"."sat_order_status" AS sc
  );