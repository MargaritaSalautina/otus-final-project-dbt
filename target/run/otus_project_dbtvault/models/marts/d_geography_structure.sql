
  create view "postgres"."dbt"."d_geography_structure__dbt_tmp" as (
    select
    cc.CITY_PK,
    cc.city_name,
    cc.country_name
FROM "postgres"."dbt"."cv_city_country" AS cc
  );