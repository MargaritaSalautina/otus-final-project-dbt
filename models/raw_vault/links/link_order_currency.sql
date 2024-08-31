{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_link_order_currency'-%}
{%- set src_pk = "LINK_ORDER_CURRENCY_PK" -%}
{%- set src_fk = ["ORDER_PK", "CURRENCY_PK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}