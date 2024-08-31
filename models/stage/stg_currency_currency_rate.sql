with stg_currency as (
    select code, CURRENCY_KEY, CURRENCY_PK from {{ref('stg_currency')}}
),

stg_currency_rate as (
    select currency_code, CURRENCY_RATE_KEY, CURRENCY_RATE_PK from {{ref('stg_currency_rate')}}
)

select  CURRENCY_KEY, CURRENCY_RATE_KEY, CURRENCY_PK, CURRENCY_RATE_PK from stg_currency sc
JOIN stg_currency_rate scr ON sc.code = scr.currency_code