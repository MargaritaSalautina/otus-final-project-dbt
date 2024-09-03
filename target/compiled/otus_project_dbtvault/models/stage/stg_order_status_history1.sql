








WITH staging AS (
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    id,
    order_id,
    status_id,
    status_datetime,
    warehouse_id

    FROM "postgres"."dbt"."source_order_status_history"
),

derived_columns AS (

    SELECT

    id,
    order_id,
    status_id,
    status_datetime,
    warehouse_id,
    id AS ORDER_STATUS_HISTORY_KEY,
    'CSV_ORDER_STATUS_HISTORY'::TEXT AS RECORD_SOURCE

    FROM source_data
),

hashed_columns AS (

    SELECT

    id,
    order_id,
    status_id,
    status_datetime,
    warehouse_id,
    ORDER_STATUS_HISTORY_KEY,
    RECORD_SOURCE,

    DECODE(MD5(NULLIF(UPPER(TRIM(CAST(id AS VARCHAR))), '')), 'hex') AS ORDER_STATUS_HISTORY_PK,

    DECODE(MD5(COALESCE(NULLIF(UPPER(TRIM(CAST(status_datetime AS VARCHAR))), ''), '^^')), 'hex') AS ORDER_STATUS_HISTORY_HASHDIFF

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    id,
    order_id,
    status_id,
    status_datetime,
    warehouse_id,
    ORDER_STATUS_HISTORY_KEY,
    RECORD_SOURCE,
    ORDER_STATUS_HISTORY_PK,
    ORDER_STATUS_HISTORY_HASHDIFF

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

SELECT *,
    current_timestamp AS LOAD_DATE,
    current_timestamp AS EFFECTIVE_FROM
FROM staging