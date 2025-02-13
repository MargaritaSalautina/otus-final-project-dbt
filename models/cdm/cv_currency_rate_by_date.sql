SELECT
    q.CURRENCY_PK,
    q.relation_to_rur,
    d.as_of_date AS date_value
FROM (
    SELECT
        ccr.CURRENCY_PK, cr.relation_to_rur, cr.date_start,
        LAG(cr.date_start) OVER (PARTITION BY ccr.CURRENCY_PK ORDER BY cr.date_start DESC) AS date_end
    FROM {{ ref('sat_currency_rate') }} cr
	LEFT JOIN {{ ref('link_currency_currency_rate') }} ccr ON ccr.CURRENCY_RATE_PK = cr.CURRENCY_RATE_PK
	)q, {{ ref('as_of_date') }} d
    WHERE d.as_of_date >= COALESCE(q.date_start, '2023-12-01') AND d.as_of_date < COALESCE(q.date_end, '2024-10-01')