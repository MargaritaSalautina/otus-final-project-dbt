-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH row_rank_1 AS (
    SELECT DISTINCT ON (rr.CLIENT_ADDRESS_PK) rr.CLIENT_ADDRESS_PK, rr.CLIENT_ADDRESS_KEY, rr.LOAD_DATE, rr.RECORD_SOURCE
    FROM "postgres"."dbt"."stg_client_address" AS rr
    WHERE rr.CLIENT_ADDRESS_PK IS NOT NULL
    ORDER BY rr.CLIENT_ADDRESS_PK, rr.LOAD_DATE
),

records_to_insert AS (
    SELECT a.CLIENT_ADDRESS_PK, a.CLIENT_ADDRESS_KEY, a.LOAD_DATE, a.RECORD_SOURCE
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert