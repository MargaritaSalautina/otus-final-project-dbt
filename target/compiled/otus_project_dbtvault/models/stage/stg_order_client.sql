with stg_orders as (
    select ORDER_KEY, ORDER_PK, id from "postgres"."dbt"."stg_orders"
),

stg_client as (
    select CLIENT_KEY, CLIENT_PK, order_id::bigint AS order_id from "postgres"."dbt"."stg_client"
)

select  ORDER_KEY, CLIENT_KEY, ORDER_PK, CLIENT_PK from stg_orders o
JOIN stg_client sc ON sc.order_id = o.id