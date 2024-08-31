{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_link_order_with_delay_order'-%}
{%- set src_pk = "LINK_ORDER_WITH_DELAY_ORDER_PK" -%}
{%- set src_fk = ["ORDER_WITH_DELAY_PK", "ORDER_PK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}