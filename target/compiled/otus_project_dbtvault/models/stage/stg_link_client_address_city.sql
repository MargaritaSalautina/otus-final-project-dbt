





with staging as (
    -- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    client_address_key,
    city_key,
    client_address_pk,
    city_pk

    FROM "postgres"."dbt"."stg_client_address_city"
),

derived_columns AS (

    SELECT

    client_address_key,
    city_key,
    client_address_pk,
    city_pk,
    'CSV_CLIENT_ADDRESS'::TEXT AS RECORD_SOURCE

    FROM source_data
),

hashed_columns AS (

    SELECT

    client_address_key,
    city_key,
    client_address_pk,
    city_pk,
    RECORD_SOURCE,

    DECODE(MD5(NULLIF(CONCAT(
        COALESCE(NULLIF(UPPER(TRIM(CAST(CITY_KEY AS VARCHAR))), ''), '^^'), '||',
        COALESCE(NULLIF(UPPER(TRIM(CAST(CLIENT_ADDRESS_KEY AS VARCHAR))), ''), '^^')
    ), '^^||^^')), 'hex') AS LINK_CLIENT_ADDRESS_CITY_PK

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    client_address_key,
    city_key,
    client_address_pk,
    city_pk,
    RECORD_SOURCE,
    LINK_CLIENT_ADDRESS_CITY_PK

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

select *, current_timestamp as LOAD_DATE,
    current_timestamp AS EFFECTIVE_FROM from staging