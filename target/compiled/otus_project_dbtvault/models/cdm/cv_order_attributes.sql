with ords as
(
SELECT
    cg.ORDER_PK,
    cg.CURRENCY_PK,
    cg.order_date,
    cg.delivery_date,
    SUM(cg.count) as good_count,
    SUM(cg.full_good_cost) as full_good_cost,
    SUM(cg.full_good_cost_rur) as full_good_cost_rur,
    cg.delivery_warehouse_pk
FROM "postgres"."dbt"."cv_goods" AS cg
group by
    cg.ORDER_PK,
    cg.CURRENCY_PK,
    cg.order_date,
    cg.delivery_date,
    cg.delivery_warehouse_pk
)
select
    ords.ORDER_PK,
    ords.CURRENCY_PK,
    ords.order_date,
    ords.delivery_date,
    ords.good_count,
    ords.full_good_cost,
    ords.full_good_cost_rur,
    ords.delivery_warehouse_pk,
    ls.WAREHOUSE_PK as current_warehouse_pk,
    ls.ORDER_STATUS_PK as current_status_pk,
    so.weight as order_weight,
    so.length * so.height * so.width as order_volume,
    oc.payer_client_type_pk,
    oc.sender_city_pk,
    oc.receiver_city_pk,
    case
        when oc.is_sender_address_valid = 'false' or oc.is_receiver_address_valid = 'false' then TRUE
        else FALSE
    end as has_problem_address,
    ba.id as business_area_id
from ords
LEFT JOIN "postgres"."dbt"."cv_last_order_status" AS ls on ls.ORDER_PK = ords.ORDER_PK
LEFT JOIN "postgres"."dbt"."sat_order" AS so on ords.ORDER_PK = so.ORDER_PK
LEFT JOIN "postgres"."dbt"."cv_order_clients_info" AS oc on oc.ORDER_PK = ords.ORDER_PK
LEFT JOIN "postgres"."dbt"."cv_business_area" AS ba on ba.receiver_type_name = oc.sender_client_type_name
    and ba.receiver_type_name = oc.receiver_client_type_name