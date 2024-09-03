
  create view "postgres"."dbt"."stg_order_status_order_status_history__dbt_tmp" as (
    with stg_order_status as (
    select ORDER_STATUS_KEY, ORDER_STATUS_PK, id from "postgres"."dbt"."stg_order_status"
),

stg_order_status_history as (
    select ORDER_STATUS_HISTORY_KEY, ORDER_STATUS_HISTORY_PK, status_id from "postgres"."dbt"."stg_order_status_history"
)

select  ORDER_STATUS_KEY, ORDER_STATUS_HISTORY_KEY, ORDER_STATUS_PK, ORDER_STATUS_HISTORY_PK from stg_order_status os
JOIN stg_order_status_history sh ON sh.status_id = os.id
  );