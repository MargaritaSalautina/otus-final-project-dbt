-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH row_rank_1 AS (
    SELECT DISTINCT ON (rr.ORDER_STATUS_HISTORY_PK) rr.ORDER_STATUS_HISTORY_PK, rr.ORDER_STATUS_HISTORY_KEY, rr.LOAD_DATE, rr.RECORD_SOURCE
    FROM "postgres"."dbt"."stg_order_status_history" AS rr
    WHERE rr.ORDER_STATUS_HISTORY_PK IS NOT NULL
    ORDER BY rr.ORDER_STATUS_HISTORY_PK, rr.LOAD_DATE
),

records_to_insert AS (
    SELECT a.ORDER_STATUS_HISTORY_PK, a.ORDER_STATUS_HISTORY_KEY, a.LOAD_DATE, a.RECORD_SOURCE
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert