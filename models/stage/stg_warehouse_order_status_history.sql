with stg_warehouse as (
    select WAREHOUSE_KEY, WAREHOUSE_PK, id from {{ref('stg_warehouse')}}
),

stg_order_status_history as (
    select ORDER_STATUS_HISTORY_KEY, ORDER_STATUS_HISTORY_PK, warehouse_id from {{ref('stg_order_status_history')}}
)

select  WAREHOUSE_KEY, ORDER_STATUS_HISTORY_KEY, WAREHOUSE_PK, ORDER_STATUS_HISTORY_PK from stg_warehouse w
JOIN stg_order_status_history sh ON sh.warehouse_id = w.id