
  create view "postgres"."dbt"."stg_link_order_order_status_history__dbt_tmp" as (
    





with staging as (
    -- Generated by AutomateDV (formerly known as dbtvault)

    

WITH source_data AS (

    SELECT

    order_key,
    order_status_history_key,
    order_pk,
    order_status_history_pk

    FROM "postgres"."dbt"."stg_order_order_status_history"
),

derived_columns AS (

    SELECT

    order_key,
    order_status_history_key,
    order_pk,
    order_status_history_pk,
    'CSV_ORDER_STATUS_HISTORY'::TEXT AS RECORD_SOURCE

    FROM source_data
),

hashed_columns AS (

    SELECT

    order_key,
    order_status_history_key,
    order_pk,
    order_status_history_pk,
    RECORD_SOURCE,

    DECODE(MD5(NULLIF(CONCAT(
        COALESCE(NULLIF(UPPER(TRIM(CAST(ORDER_KEY AS VARCHAR))), ''), '^^'), '||',
        COALESCE(NULLIF(UPPER(TRIM(CAST(ORDER_STATUS_HISTORY_KEY AS VARCHAR))), ''), '^^')
    ), '^^||^^')), 'hex') AS LINK_ORDER_ORDER_STATUS_HISTORY_PK

    FROM derived_columns
),

columns_to_select AS (

    SELECT

    order_key,
    order_status_history_key,
    order_pk,
    order_status_history_pk,
    RECORD_SOURCE,
    LINK_ORDER_ORDER_STATUS_HISTORY_PK

    FROM hashed_columns
)

SELECT * FROM columns_to_select
)

select *, current_timestamp as LOAD_DATE,
    current_timestamp AS EFFECTIVE_FROM from staging
  );