{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_currency_rate' -%}
{%- set src_pk = "CURRENCY_RATE_PK" -%}
{%- set src_hashdiff = "CURRENCY_RATE_HASHDIFF" -%}
{%- set src_payload = ["relation_to_rur", "date_start", "date_end"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}