
  create view "postgres"."dbt"."stg_city__dbt_tmp" as (
    








WITH staging AS (
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    id,
    name,
    country_id

    FROM "postgres"."dbt"."source_city"
),

derived_columns AS (

    SELECT

    id,
    name,
    country_id,
    id AS CITY_KEY,
    'CSV_CITY'::TEXT AS RECORD_SOURCE

    FROM source_data
),

hashed_columns AS (

    SELECT

    id,
    name,
    country_id,
    CITY_KEY,
    RECORD_SOURCE,

    DECODE(MD5(NULLIF(UPPER(TRIM(CAST(id AS VARCHAR))), '')), 'hex') AS CITY_PK,

    DECODE(MD5(COALESCE(NULLIF(UPPER(TRIM(CAST(name AS VARCHAR))), ''), '^^')), 'hex') AS CITY_HASHDIFF

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    id,
    name,
    country_id,
    CITY_KEY,
    RECORD_SOURCE,
    CITY_PK,
    CITY_HASHDIFF

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

SELECT *,
    current_timestamp AS LOAD_DATE,
    current_timestamp AS EFFECTIVE_FROM
FROM staging
  );