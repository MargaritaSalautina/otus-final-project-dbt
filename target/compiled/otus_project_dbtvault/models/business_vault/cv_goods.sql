with ords as (
SELECT
    so.ORDER_PK,
    so.order_date,
    case
        when os.name in ('Частично вручено', 'Не вручено', 'Вручено') then ls.status_datetime
        else null
    end as delivery_date,
        case
        when os.name in ('Частично вручено', 'Не вручено', 'Вручено') then ls.WAREHOUSE_PK
        else null
    end as delivery_warehouse_pk,
    oc.CURRENCY_PK
FROM "postgres"."dbt"."sat_order" AS so
LEFT JOIN "postgres"."dbt"."cv_last_order_status" AS ls on ls.ORDER_PK = so.ORDER_PK
LEFT JOIN "postgres"."dbt"."sat_order_status" AS os on os.ORDER_STATUS_PK = ls.ORDER_STATUS_PK
LEFT JOIN "postgres"."dbt"."link_order_currency" AS oc on oc.ORDER_PK = so.ORDER_PK
)
select
    ords.ORDER_PK,
    ords.CURRENCY_PK,
    ords.order_date,
    ords.delivery_date,
    sg.GOOD_PK,
    sg.count,
    sg.cost_per_unit,
    sg.cost_per_unit * COALESCE(relation_to_rur, 1) as cost_per_unit_rur,
    sg.cost_per_unit * sg.count as full_good_cost,
    sg.cost_per_unit * COALESCE(relation_to_rur, 1) * sg.count as full_good_cost_rur,
    ords.delivery_warehouse_pk
from ords
LEFT JOIN "postgres"."dbt"."link_order_goods" AS og on og.ORDER_PK = ords.ORDER_PK
LEFT JOIN "postgres"."dbt"."sat_good" AS sg on sg.GOOD_PK = og.GOOD_PK
LEFT JOIN "postgres"."dbt"."cv_currency_rate_by_date" AS crr on crr.CURRENCY_PK = ords.CURRENCY_PK
    and crr.date_value = COALESCE(ords.delivery_date, ords.order_date)