{{
    config(enabled=True)
}}

{%- set yaml_metadata -%}
source_model: 'stg_order_goods'
derived_columns:
    RECORD_SOURCE: '!CSV_GOODS'
hashed_columns:
    LINK_CUSTOMER_ORDER_PK:
        - 'ORDER_KEY'
        - 'GOOD_KEY'
{%- endset -%}


{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set hashed_columns = metadata_dict['hashed_columns'] %}

with staging as (
    {{ automate_dv.stage(include_source_columns=true,
                    source_model=source_model,
                    derived_columns=derived_columns,
                    hashed_columns=hashed_columns,
                    ranked_columns=none)
    }}
)

select *, {{var('load_date')}} as LOAD_DATE,
    {{ var('load_date') }} AS EFFECTIVE_FROM from staging