








WITH staging AS (
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    id,
    order_id,
    name,
    cost_per_unit,
    count

    FROM "postgres"."dbt"."source_goods"
),

derived_columns AS (

    SELECT

    id,
    order_id,
    name,
    cost_per_unit,
    count,
    id AS GOOD_KEY,
    'CSV_GOODS'::TEXT AS RECORD_SOURCE

    FROM source_data
),

hashed_columns AS (

    SELECT

    id,
    order_id,
    name,
    cost_per_unit,
    count,
    GOOD_KEY,
    RECORD_SOURCE,

    DECODE(MD5(NULLIF(UPPER(TRIM(CAST(id AS VARCHAR))), '')), 'hex') AS GOOD_PK,

    DECODE(MD5(CONCAT(
        COALESCE(NULLIF(UPPER(TRIM(CAST(cost_per_unit AS VARCHAR))), ''), '^^'), '||',
        COALESCE(NULLIF(UPPER(TRIM(CAST(count AS VARCHAR))), ''), '^^'), '||',
        COALESCE(NULLIF(UPPER(TRIM(CAST(name AS VARCHAR))), ''), '^^')
    )), 'hex') AS GOOD_HASHDIFF

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    id,
    order_id,
    name,
    cost_per_unit,
    count,
    GOOD_KEY,
    RECORD_SOURCE,
    GOOD_PK,
    GOOD_HASHDIFF

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

SELECT *,
    current_timestamp AS LOAD_DATE,
    current_timestamp AS EFFECTIVE_FROM
FROM staging