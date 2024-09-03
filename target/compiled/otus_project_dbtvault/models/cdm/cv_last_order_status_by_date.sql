WITH order_status_history as (
    SELECT
        lo.ORDER_PK,
	    lo.ORDER_STATUS_HISTORY_PK,
        to_date(status_datetime, 'yyyy-mm-dd') as status_date,
        row_number() over (partition by lo.ORDER_PK, to_date(status_datetime, 'yyyy-mm-dd')  order by to_date(status_datetime, 'yyyy-mm-dd hh24:mi') desc) as row_num
    FROM "postgres"."dbt"."sat_order_status_history" AS so
    LEFT JOIN "postgres"."dbt"."link_order_order_status_history" AS lo on lo.ORDER_STATUS_HISTORY_PK = so.ORDER_STATUS_HISTORY_PK
)
select
    lw.WAREHOUSE_PK,
	os.status_date,
	os.ORDER_PK
from order_status_history os
LEFT JOIN "postgres"."dbt"."link_warehouse_order_status_history" AS lw on lw.ORDER_STATUS_HISTORY_PK = os.ORDER_STATUS_HISTORY_PK
where os.row_num = 1