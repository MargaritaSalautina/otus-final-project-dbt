with stg_city as (
    select CITY_KEY, CITY_PK, country_id from "postgres"."dbt"."stg_city"
),

stg_country as (
    select id, COUNTRY_KEY, COUNTRY_PK from "postgres"."dbt"."stg_country"
)

select  CITY_KEY, COUNTRY_KEY, CITY_PK, COUNTRY_PK from stg_city sci
JOIN stg_country sc ON sc.id = sci.country_id