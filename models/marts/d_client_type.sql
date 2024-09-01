select
    sc.CLIENT_TYPE_PK,
    sc.name
FROM {{ ref('sat_client_type') }} AS sc