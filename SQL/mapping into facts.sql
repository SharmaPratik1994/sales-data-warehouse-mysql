INSERT INTO facts (
    order_id,
    order_date,
    ship_date,
    customer_key,
    product_key,
    segment_key,
    location_key,
    sales,
    quantity,
    discount,
    profit
)
SELECT 
    s.order_id,
    s.order_date,
    s.ship_date,
    c.customer_key,
    p.product_key,
    sg.segment_key,
    l.location_key,
    s.sales,
    s.quantity,
    s.discount,
    s.profit
FROM stagging_facts s

JOIN dim_customers c 
    ON TRIM(s.customer_id) = TRIM(c.customer_id)

JOIN dim_product p 
    ON TRIM(s.product_id) = TRIM(p.product_id)

JOIN dim_segments sg 
    ON TRIM(s.segment) = TRIM(sg.segments)

JOIN dim_location l 
    ON TRIM(s.city) = TRIM(l.city)
   AND TRIM(s.state) = TRIM(l.state)
   AND TRIM(s.postal_code) = TRIM(l.postal_code);