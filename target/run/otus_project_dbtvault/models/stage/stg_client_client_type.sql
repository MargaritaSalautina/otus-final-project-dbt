
  create view "postgres"."dbt"."stg_client_client_type__dbt_tmp" as (
    with stg_client_type as (
    select CLIENT_TYPE_KEY, CLIENT_TYPE_PK, id from "postgres"."dbt"."stg_client_type"
),

stg_client as (
    select CLIENT_KEY, CLIENT_PK, type_id from "postgres"."dbt"."stg_client"
)

select  CLIENT_TYPE_KEY, CLIENT_KEY, CLIENT_TYPE_PK, CLIENT_PK from stg_client_type ct
JOIN stg_client sc ON sc.type_id = ct.id
  );