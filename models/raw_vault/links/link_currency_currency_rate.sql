{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_link_currency_currency_rate'-%}
{%- set src_pk = "LINK_CURRENCY_CURRENCY_RATE_PK" -%}
{%- set src_fk = ["CURRENCY_PK", "CURRENCY_RATE_PK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}