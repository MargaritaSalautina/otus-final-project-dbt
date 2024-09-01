select
    ba.id,
    ba.business_area_name
FROM {{ ref('cv_business_area') }} AS ba