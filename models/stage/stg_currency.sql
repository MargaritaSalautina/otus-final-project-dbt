{{
    config(
        enabled=True
    )
}}

{%- set yaml_metadata -%}
source_model: 'source_currency'
derived_columns:
  CURRENCY_KEY: 'code'
  RECORD_SOURCE: '!CSV_CURRENCY'
hashed_columns:
  CURRENCY_PK: 'code'
  CURRENCY_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'name'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}


WITH staging AS (
{{ automate_dv.stage(include_source_columns=true,
                     source_model=source_model,
                     derived_columns=derived_columns,
                     hashed_columns=hashed_columns,
                     ranked_columns=none) }}
)

SELECT *,
    {{ var('load_date') }} AS LOAD_DATE,
    {{ var('load_date') }} AS EFFECTIVE_FROM
FROM staging