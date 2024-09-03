
  create view "postgres"."dbt"."stg_order_currency__dbt_tmp" as (
    with stg_orders as (
    select ORDER_KEY, ORDER_PK, currency_code from "postgres"."dbt"."stg_orders"
),

stg_currency as (
    select code, CURRENCY_KEY, CURRENCY_PK from "postgres"."dbt"."stg_currency"
)

select  ORDER_KEY, CURRENCY_KEY, ORDER_PK, CURRENCY_PK from stg_orders o
JOIN stg_currency sc ON sc.code = o.currency_code
  );