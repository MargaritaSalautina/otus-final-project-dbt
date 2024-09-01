WITH order_status_history as (
    SELECT
        lo.ORDER_PK,
	    lo.ORDER_STATUS_HISTORY_PK,
        to_date(status_datetime, 'yyyy-mm-dd hh24:mi') as status_datetime,
        row_number() over (partition by lo.ORDER_PK order by to_date(status_datetime, 'yyyy-mm-dd hh24:mi') desc) as row_num
    FROM {{ ref('sat_order_status_history') }} AS so
    LEFT JOIN {{ ref('link_order_order_status_history') }} AS lo on lo.ORDER_STATUS_HISTORY_PK = so.ORDER_STATUS_HISTORY_PK
)
select
    os.ORDER_PK,
	os.status_datetime,
    loo.ORDER_STATUS_PK,
lw.WAREHOUSE_PK
from order_status_history os
LEFT JOIN {{ ref('link_order_status_order_status_history') }} AS loo on loo.ORDER_STATUS_HISTORY_PK = os.ORDER_STATUS_HISTORY_PK
LEFT JOIN {{ ref('link_warehouse_order_status_history') }} AS lw on lw.ORDER_STATUS_HISTORY_PK = os.ORDER_STATUS_HISTORY_PK
where os.row_num = 1