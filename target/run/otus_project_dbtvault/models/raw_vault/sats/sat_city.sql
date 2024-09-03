
      
  
    

  create  table "postgres"."dbt"."sat_city"
  as (
    -- Generated by AutomateDV (formerly known as dbtvault)

    WITH source_data AS (
    SELECT a.CITY_PK, a.CITY_HASHDIFF, a.name, a.EFFECTIVE_FROM, a.LOAD_DATE, a.RECORD_SOURCE
    FROM "postgres"."dbt"."stg_city" AS a
    WHERE a.CITY_PK IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage.CITY_PK, stage.CITY_HASHDIFF, stage.name, stage.EFFECTIVE_FROM, stage.LOAD_DATE, stage.RECORD_SOURCE
    FROM source_data AS stage

)

SELECT * FROM records_to_insert
  );
  
  