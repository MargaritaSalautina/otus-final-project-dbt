select
    cg.GOOD_PK,
    cg.count as good_count,
    cg.order_date,
    cg.delivery_date,
    cg.CURRENCY_PK,
    cg.full_good_cost as good_cost_original,
    cg.full_good_cost_rur as good_cost_rur,
    cg.delivery_warehouse_pk
FROM "postgres"."dbt"."cv_goods" AS cg