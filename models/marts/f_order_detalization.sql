with ords_delay as
(
select
    lowd.ORDER_PK,
    count(owd.ORDER_WITH_DELAY_PK) as delay_reasons_count
FROM {{ ref('sat_order_with_delay') }} AS owd
left join {{ ref('link_order_with_delay_order') }} AS lowd on lowd.ORDER_WITH_DELAY_PK = owd.ORDER_WITH_DELAY_PK
group by lowd.ORDER_PK
)
select
    ca.ORDER_PK,
    ca.CURRENCY_PK,
    ca.order_date,
    ca.delivery_date,
    ca.good_count,
    ca.full_good_cost as order_cost_original,
    ca.full_good_cost_rur as order_cost_rur,
    ca.current_warehouse_pk,
    ca.current_status_pk,
    ca.order_weight,
    ca.payer_client_type_pk,
    ca.sender_city_pk,
    ca.receiver_city_pk,
    ca.has_problem_address,
    ca.business_area_id,
    case
        when ords_delay.delay_reasons_count >= 0 then TRUE
        else FALSE
    end as has_delay
FROM {{ ref('cv_order_attributes') }} AS ca
left join ords_delay on ords_delay.ORDER_PK = ca.ORDER_PK
