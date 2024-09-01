SELECT
    loc.ORDER_PK,
    sc.CLIENT_PK,
    lacc.CITY_PK,
    lcc.CLIENT_TYPE_PK,
    sac.is_valid
FROM {{ ref('sat_client') }} AS sc
LEFT JOIN {{ ref('link_order_client') }} AS loc on loc.CLIENT_PK = sc.CLIENT_PK
LEFT JOIN {{ ref('link_client_address_client') }} AS lac on lac.CLIENT_PK = sc.CLIENT_PK
LEFT JOIN {{ ref('link_client_address_city') }} AS lacc on lacc.CLIENT_ADDRESS_PK = lac.CLIENT_ADDRESS_PK
LEFT JOIN {{ ref('sat_client_address') }} AS sac on sac.CLIENT_ADDRESS_PK = lac.CLIENT_ADDRESS_PK
LEFT JOIN {{ ref('link_client_client_type') }} AS lcc on lcc.CLIENT_PK = sc.CLIENT_PK
WHERE sc.client_type_code = 'receiver'