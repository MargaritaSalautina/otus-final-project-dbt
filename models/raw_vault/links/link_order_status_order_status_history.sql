{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_link_order_status_order_status_history'-%}
{%- set src_pk = "LINK_ORDER_STATUS_ORDER_STATUS_HISTORY_PK" -%}
{%- set src_fk = ["ORDER_STATUS_PK", "ORDER_STATUS_HISTORY_PK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}