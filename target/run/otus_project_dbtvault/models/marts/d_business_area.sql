
  create view "postgres"."dbt"."d_business_area__dbt_tmp" as (
    select
    ba.id,
    ba.business_area_name
FROM "postgres"."dbt"."cv_business_area" AS ba
  );