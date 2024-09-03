
  create view "postgres"."dbt"."d_client_type__dbt_tmp" as (
    select
    sc.CLIENT_TYPE_PK,
    sc.name
FROM "postgres"."dbt"."sat_client_type" AS sc
  );