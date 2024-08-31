{{
    config(
        enabled=True
    )
}}

{%- set source_model = 'stg_link_client_client_type'-%}
{%- set src_pk = "LINK_CLIENT_CLIENT_TYPE_PK" -%}
{%- set src_fk = ["CLIENT_PK", "CLIENT_TYPE_PK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}