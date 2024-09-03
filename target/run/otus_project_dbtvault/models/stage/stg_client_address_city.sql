
  create view "postgres"."dbt"."stg_client_address_city__dbt_tmp" as (
    with stg_city as (
    select CITY_KEY, CITY_PK, id from "postgres"."dbt"."stg_city"
),

stg_client_address as (
    select CLIENT_ADDRESS_KEY, CLIENT_ADDRESS_PK, city_id::bigint AS city_id from "postgres"."dbt"."stg_client_address"
)

select  CLIENT_ADDRESS_KEY, CITY_KEY, CLIENT_ADDRESS_PK, CITY_PK from stg_city sc
JOIN stg_client_address sca ON sc.id = sca.city_id
  );