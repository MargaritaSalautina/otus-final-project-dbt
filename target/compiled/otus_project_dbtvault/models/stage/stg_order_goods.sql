with stg_orders as (
    select id, ORDER_KEY, ORDER_PK from "postgres"."dbt"."stg_orders"
),

stg_goods as (
    select GOOD_KEY, GOOD_PK, order_id::bigint AS order_id from "postgres"."dbt"."stg_goods"
)

select  ORDER_KEY, GOOD_KEY, ORDER_PK, GOOD_PK from stg_orders o
JOIN stg_goods g ON g.order_id = o.id