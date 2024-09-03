
  create view "postgres"."dbt"."stg_order_with_delay_order__dbt_tmp" as (
    with stg_order as (
    select id, ORDER_KEY, ORDER_PK from "postgres"."dbt"."stg_orders"
),

stg_order_with_delay as (
    select ORDER_WITH_DELAY_KEY, ORDER_WITH_DELAY_PK, order_id from "postgres"."dbt"."stg_order_with_delay"
)

select  ORDER_KEY, ORDER_WITH_DELAY_KEY, ORDER_PK, ORDER_WITH_DELAY_PK from stg_order o
JOIN stg_order_with_delay od ON o.id = od.order_id
  );