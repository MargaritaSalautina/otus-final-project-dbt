{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_warehouse' -%}
{%- set src_pk = "WAREHOUSE_PK" -%}
{%- set src_nk = "WAREHOUSE_KEY" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{
    automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,src_source=src_source, source_model=source_model)
}}