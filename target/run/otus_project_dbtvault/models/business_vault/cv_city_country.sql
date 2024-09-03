
  create view "postgres"."dbt"."cv_city_country__dbt_tmp" as (
    select
    sci.CITY_PK,
    sci.name AS city_name,
    sco.name AS country_name
FROM "postgres"."dbt"."sat_city" AS sci
LEFT JOIN "postgres"."dbt"."link_city_country" AS ccl on ccl.CITY_PK = sci.CITY_PK
LEFT JOIN "postgres"."dbt"."sat_country" AS sco ON sco.COUNTRY_PK = ccl.COUNTRY_PK
  );