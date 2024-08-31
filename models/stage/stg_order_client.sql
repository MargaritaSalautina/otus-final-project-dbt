with stg_orders as (
    select ORDER_KEY, ORDER_PK, id from {{ref('stg_orders')}}
),

stg_client as (
    select CLIENT_KEY, CLIENT_PK, order_id from {{ref('stg_client')}}
)

select  ORDER_KEY, CLIENT_KEY, ORDER_PK, CLIENT_PK from stg_orders o
JOIN stg_client sc ON sc.order_id = o.id