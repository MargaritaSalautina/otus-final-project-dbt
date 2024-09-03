select
    cc.CITY_PK,
    cc.city_name,
    cc.country_name
FROM "postgres"."dbt"."cv_city_country" AS cc