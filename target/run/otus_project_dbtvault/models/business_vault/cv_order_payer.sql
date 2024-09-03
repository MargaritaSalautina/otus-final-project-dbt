
  create view "postgres"."dbt"."cv_order_payer__dbt_tmp" as (
    SELECT
    loc.ORDER_PK,
    sc.CLIENT_PK,
    lacc.CITY_PK,
    lcc.CLIENT_TYPE_PK,
    sac.is_valid
FROM "postgres"."dbt"."sat_client" AS sc
LEFT JOIN "postgres"."dbt"."link_order_client" AS loc on loc.CLIENT_PK = sc.CLIENT_PK
LEFT JOIN "postgres"."dbt"."link_client_address_client" AS lac on lac.CLIENT_PK = sc.CLIENT_PK
LEFT JOIN "postgres"."dbt"."link_client_address_city" AS lacc on lacc.CLIENT_ADDRESS_PK = lac.CLIENT_ADDRESS_PK
LEFT JOIN "postgres"."dbt"."sat_client_address" AS sac on sac.CLIENT_ADDRESS_PK = lac.CLIENT_ADDRESS_PK
LEFT JOIN "postgres"."dbt"."link_client_client_type" AS lcc on lcc.CLIENT_PK = sc.CLIENT_PK
WHERE sc.client_type_code = 'payer'
  );