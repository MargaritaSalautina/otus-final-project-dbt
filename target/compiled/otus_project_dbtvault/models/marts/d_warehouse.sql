select
    cw.WAREHOUSE_PK,
    cw.name as warehouse_name,
    cw.system_name as warehouse_system_name,
    cc.city_name,
    cc.country_name
FROM "postgres"."dbt"."cv_warehouse" AS cw
LEFT JOIN "postgres"."dbt"."cv_city_country" AS cc on cw.CITY_PK = cc.CITY_PK