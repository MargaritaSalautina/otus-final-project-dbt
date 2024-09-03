select
    so.ORDER_PK,
    cop.CLIENT_PK as payer_client_pk,
    ctp.CLIENT_TYPE_PK as payer_client_type_pk,
    ctp.name as payer_client_type_name,
    cos.CLIENT_PK as sender_client_pk,
    cos.CITY_PK as sender_city_pk,
    cos.is_valid as is_sender_address_valid,
    cts.CLIENT_TYPE_PK as sender_client_type_pk,
    cts.name as sender_client_type_name,
    cor.CLIENT_PK as receiver_client_pk,
    cor.CITY_PK as receiver_city_pk,
    cor.is_valid as is_receiver_address_valid,
    ctr.CLIENT_TYPE_PK as receiver_client_type_pk,
    ctr.name as receiver_client_type_name
from "postgres"."dbt"."sat_order" AS so
LEFT JOIN "postgres"."dbt"."cv_order_payer" AS cop on cop.ORDER_PK = so.ORDER_PK
LEFT JOIN "postgres"."dbt"."sat_client_type" AS ctp on ctp.CLIENT_TYPE_PK = cop.CLIENT_TYPE_PK
LEFT JOIN "postgres"."dbt"."cv_order_sender" AS cos on cos.ORDER_PK = so.ORDER_PK
LEFT JOIN "postgres"."dbt"."sat_client_type" AS cts on cts.CLIENT_TYPE_PK = cos.CLIENT_TYPE_PK
LEFT JOIN "postgres"."dbt"."cv_order_receiver" AS cor on cor.ORDER_PK = so.ORDER_PK
LEFT JOIN "postgres"."dbt"."sat_client_type" AS ctr on ctr.CLIENT_TYPE_PK = cor.CLIENT_TYPE_PK