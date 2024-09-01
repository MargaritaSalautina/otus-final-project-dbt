select
    sci.CITY_PK,
    sci.name AS city_name,
    sco.name AS country_name
FROM {{ ref('sat_city') }} AS sci
LEFT JOIN {{ ref('link_city_country') }} AS ccl on ccl.CITY_PK = sci.CITY_PK
LEFT JOIN {{ ref('sat_country') }} AS sco ON sco.COUNTRY_PK = ccl.COUNTRY_PK