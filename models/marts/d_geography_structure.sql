select
    cc.CITY_PK,
    cc.city_name,
    cc.country_name
FROM {{ ref('cv_city_country') }} AS cc
