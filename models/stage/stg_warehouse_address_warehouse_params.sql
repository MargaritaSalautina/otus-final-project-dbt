with stg_warehouse_address as (
    select WAREHOUSE_ADDRESS_KEY, WAREHOUSE_ADDRESS_PK, id from {{ref('stg_warehouse_address')}}
),

stg_warehouse_params as (
    select WAREHOUSE_PARAMS_KEY, WAREHOUSE_PARAMS_PK, address_id from {{ref('stg_warehouse_params')}}
)

select  WAREHOUSE_ADDRESS_KEY, WAREHOUSE_PARAMS_KEY, WAREHOUSE_ADDRESS_PK, WAREHOUSE_PARAMS_PK from stg_warehouse_address wa
JOIN stg_warehouse_params wp ON wp.address_id = wa.id