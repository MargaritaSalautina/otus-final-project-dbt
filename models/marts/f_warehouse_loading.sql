with precalc as
(SELECT
    so.WAREHOUSE_PK,
	so.status_date,
	SUM(ca.good_count) as good_count,
    SUM(ca.order_weight) as good_weight,
    SUM(ca.order_volume) as good_volume
FROM {{ ref('cv_last_order_status_by_date') }} AS so
left join {{ ref('cv_order_attributes') }} AS ca on ca.ORDER_PK = so.ORDER_PK
group by so.WAREHOUSE_PK,
	so.status_date
)
select
    p.WAREHOUSE_PK,
	p.status_date,
	p.good_count,
    p.good_weight,
    p.good_volume,
	cw.max_loading_weight,
    cw.max_loading_volume,
    case
        when p.good_weight > cw.max_loading_weight then TRUE
        else FALSE
    end as has_weight_overload,
    case
        when p.good_volume > cw.max_loading_volume then TRUE
        else FALSE
    end as has_volume_overload
from precalc p
left join {{ ref('cv_warehouse') }} AS cw on cw.WAREHOUSE_PK = p.WAREHOUSE_PK