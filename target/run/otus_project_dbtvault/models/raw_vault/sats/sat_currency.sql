
      
  
    

  create  table "postgres"."dbt"."sat_currency"
  as (
    -- Generated by AutomateDV (formerly known as dbtvault)

    WITH source_data AS (
    SELECT a.CURRENCY_PK, a.CURRENCY_HASHDIFF, a.name, a.EFFECTIVE_FROM, a.LOAD_DATE, a.RECORD_SOURCE
    FROM "postgres"."dbt"."stg_currency" AS a
    WHERE a.CURRENCY_PK IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage.CURRENCY_PK, stage.CURRENCY_HASHDIFF, stage.name, stage.EFFECTIVE_FROM, stage.LOAD_DATE, stage.RECORD_SOURCE
    FROM source_data AS stage

)

SELECT * FROM records_to_insert
  );
  
  