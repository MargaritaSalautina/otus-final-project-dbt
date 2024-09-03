








WITH staging AS (
-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    order_id,
    client_type_code,
    name,
    type_id,
    client_address_id

    FROM "postgres"."dbt"."source_client"
),

derived_columns AS (

    SELECT

    order_id,
    client_type_code,
    name,
    type_id,
    client_address_id,
    CONCAT(
        order_id, '||',
        client_type_code
    ) AS CLIENT_KEY,
    'CSV_CLIENT'::TEXT AS RECORD_SOURCE

    FROM source_data
),

hashed_columns AS (

    SELECT

    order_id,
    client_type_code,
    name,
    type_id,
    client_address_id,
    CLIENT_KEY,
    RECORD_SOURCE,

    DECODE(MD5(NULLIF(CONCAT(
        COALESCE(NULLIF(UPPER(TRIM(CAST(order_id AS VARCHAR))), ''), '^^'), '||',
        COALESCE(NULLIF(UPPER(TRIM(CAST(client_type_code AS VARCHAR))), ''), '^^')
    ), '^^||^^')), 'hex') AS CLIENT_PK,

    DECODE(MD5(CONCAT(
        COALESCE(NULLIF(UPPER(TRIM(CAST(client_type_code AS VARCHAR))), ''), '^^'), '||',
        COALESCE(NULLIF(UPPER(TRIM(CAST(name AS VARCHAR))), ''), '^^')
    )), 'hex') AS CLIENT_HASHDIFF

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    order_id,
    client_type_code,
    name,
    type_id,
    client_address_id,
    CLIENT_KEY,
    RECORD_SOURCE,
    CLIENT_PK,
    CLIENT_HASHDIFF

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

SELECT *,
    current_timestamp AS LOAD_DATE,
    current_timestamp AS EFFECTIVE_FROM
FROM staging