
  create view "postgres"."dbt"."d_currency__dbt_tmp" as (
    select
    sc.CURRENCY_PK,
    sc.name
FROM "postgres"."dbt"."sat_currency" AS sc
  );