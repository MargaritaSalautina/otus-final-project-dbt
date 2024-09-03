with stg_client as (
    select CLIENT_KEY, CLIENT_PK, client_address_id from "postgres"."dbt"."stg_client"
),

stg_client_address as (
    select CLIENT_ADDRESS_KEY, CLIENT_ADDRESS_PK, id::bigint AS id from "postgres"."dbt"."stg_client_address"
)

select  CLIENT_ADDRESS_KEY, CLIENT_KEY, CLIENT_ADDRESS_PK, CLIENT_PK from stg_client sc
JOIN stg_client_address sca ON sca.id = sc.client_address_id