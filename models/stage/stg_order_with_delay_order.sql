with stg_order as (
    select id, ORDER_KEY, ORDER_PK from {{ref('stg_orders')}}
),

stg_order_with_delay as (
    select ORDER_WITH_DELAY_KEY, ORDER_WITH_DELAY_PK, order_id from {{ref('stg_order_with_delay')}}
)

select  ORDER_KEY, ORDER_WITH_DELAY_KEY, ORDER_PK, ORDER_WITH_DELAY_PK from stg_order o
JOIN stg_order_with_delay od ON o.id = od.order_id