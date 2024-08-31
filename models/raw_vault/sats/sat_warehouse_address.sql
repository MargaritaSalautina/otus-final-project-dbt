{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_warehouse_address' -%}
{%- set src_pk = "WAREHOUSE_ADDRESS_PK" -%}
{%- set src_hashdiff = "WAREHOUSE_ADDRESS_HASHDIFF" -%}
{%- set src_payload = ["street", "house"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                   src_payload=src_payload, src_eff=src_eff,
                   src_ldts=src_ldts, src_source=src_source,
                   source_model=source_model) }}