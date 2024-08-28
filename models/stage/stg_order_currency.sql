with stg_order as (
    select ORDER_KEY, ORDER_PK, currency_code from {{ref('stg_orders')}}
),

stg_curency as (
    select code, CURRENCY_KEY, CURRENCY_PK from {{ref('stg_currency')}}
)

select  ORDER_KEY, CURRENCY_KEY, ORDER_PK, CURRENCY_PK from stg_orders o
JOIN stg_currency sc ON sc.code = o.currency_code