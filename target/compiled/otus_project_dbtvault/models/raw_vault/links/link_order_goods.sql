-- Generated by AutomateDV (formerly known as dbtvault)

    

WITH row_rank_1 AS (
  SELECT * FROM (
    SELECT rr.LINK_ORDER_GOOD_PK, rr.ORDER_PK, rr.GOOD_PK, rr.LOAD_DATE, rr.RECORD_SOURCE,
           ROW_NUMBER() OVER(
               PARTITION BY rr.LINK_ORDER_GOOD_PK
               ORDER BY rr.LOAD_DATE
           ) AS row_number
    FROM "postgres"."dbt"."stg_link_order_goods" AS rr
    WHERE rr.LINK_ORDER_GOOD_PK IS NOT NULL
    AND rr.ORDER_PK IS NOT NULL
    AND rr.GOOD_PK IS NOT NULL
  ) as l
  WHERE row_number = 1
),

records_to_insert AS (
    SELECT a.LINK_ORDER_GOOD_PK, a.ORDER_PK, a.GOOD_PK, a.LOAD_DATE, a.RECORD_SOURCE
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert