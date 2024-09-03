with stg_orders as (
    select ORDER_KEY, ORDER_PK, id from "postgres"."dbt"."stg_orders"
),

stg_order_status_history as (
    select ORDER_STATUS_HISTORY_KEY, ORDER_STATUS_HISTORY_PK, order_id from "postgres"."dbt"."stg_order_status_history"
)

select  ORDER_KEY, ORDER_STATUS_HISTORY_KEY, ORDER_PK, ORDER_STATUS_HISTORY_PK from stg_orders o
JOIN stg_order_status_history sh ON sh.order_id = o.id