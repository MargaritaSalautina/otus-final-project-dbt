SELECT
    d.as_of_date as date_value,
    extract(YEAR FROM d.as_of_date) as year,
    extract(MONTH FROM d.as_of_date) as month,
    extract(DAY FROM d.as_of_date) as day,
    extract(WEEK FROM d.as_of_date) as week
FROM {{ ref('as_of_date') }} AS d