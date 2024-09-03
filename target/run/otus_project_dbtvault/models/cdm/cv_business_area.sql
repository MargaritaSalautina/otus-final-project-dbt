
  create view "postgres"."dbt"."cv_business_area__dbt_tmp" as (
    select
    1 as id,
    'ФЛ' as receiver_type_name,
    'ФЛ' as sender_type_name,
    'C2C' as business_area_name
UNION
select
    2 as id,
    'ФЛ' as receiver_type_name,
    'ЮЛ' as sender_type_name,
    'C2B' as business_area_name
UNION
select
    3 as id,
    'ЮЛ' as receiver_type_name,
    'ЮЛ' as sender_type_name,
    'B2B' as business_area_name
UNION
select
    4 as id,
    'ЮЛ' as receiver_type_name,
    'ФЛ' as sender_type_name,
    'B2C' as business_area_name
  );