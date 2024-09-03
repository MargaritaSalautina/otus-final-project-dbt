
      
  
    

  create  table "postgres"."dbt"."hub_client_type"
  as (
    -- Generated by AutomateDV (formerly known as dbtvault)

    

WITH row_rank_1 AS (
    SELECT DISTINCT ON (rr.CLIENT_TYPE_PK) rr.CLIENT_TYPE_PK, rr.CLIENT_TYPE_KEY, rr.LOAD_DATE, rr.RECORD_SOURCE
    FROM "postgres"."dbt"."stg_client_type" AS rr
    WHERE rr.CLIENT_TYPE_PK IS NOT NULL
    ORDER BY rr.CLIENT_TYPE_PK, rr.LOAD_DATE
),

records_to_insert AS (
    SELECT a.CLIENT_TYPE_PK, a.CLIENT_TYPE_KEY, a.LOAD_DATE, a.RECORD_SOURCE
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert
  );
  
  