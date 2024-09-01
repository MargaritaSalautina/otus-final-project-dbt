select
    sc.CURRENCY_PK,
    sc.name
FROM {{ ref('sat_currency') }} AS sc