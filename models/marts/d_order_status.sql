select
    sc.ORDER_STATUS_PK,
    sc.name
FROM {{ ref('sat_order_status') }} AS sc