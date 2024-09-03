
  create view "postgres"."dbt"."cv_date__dbt_tmp" as (
    WITH
RECURSIVE dates AS (
    SELECT
        '2023-12-01'::TIMESTAMP AS date_value
    UNION
    SELECT
        date_value + INTERVAL '1' DAY AS date_value
    FROM dates
    WHERE date_value <= '2024-10-01'
)
select date_value from dates
  );