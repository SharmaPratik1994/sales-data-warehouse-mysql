#### Top 5 customers based on sales

SELECT *
FROM (
    SELECT 
        c.customer_name,
        c.customer_key,
        SUM(f.sales) AS total,
        RANK() OVER (ORDER BY SUM(f.sales) DESC) AS rnk
    FROM dim_customers c
    JOIN facts f 
    ON c.customer_key = f.customer_key
    GROUP BY c.customer_name, c.customer_key
) t
WHERE rnk <= 5;

#### Bottom 10 customers based on profits

SELECT *
FROM (
  SELECT 
    c.customer_name, 
    SUM(f.profit) AS total_profit,
    RANK() OVER (ORDER BY SUM(f.profit) ASC) AS rnk
FROM dim_customers c
JOIN facts f
ON c.customer_key = f.customer_key
GROUP BY c.customer_name
) t
where rnk <=10
order by total_profit asc;



#### Running sum of sales of corporate segment from past Three-Month range

SELECT 
    order_date,
    'corporate' as segments,
    SUM(daily_sales) OVER (
        ORDER BY order_date 
        RANGE BETWEEN INTERVAL 3 MONTH PRECEDING AND CURRENT ROW
    ) AS rolling_3_month_sales
FROM (
    SELECT 
        f.order_date,
        SUM(f.sales) AS daily_sales
    FROM dim_segments s
    JOIN facts f
    ON s.segment_key = f.segment_key
    WHERE s.segments = 'Corporate'
    GROUP BY f.order_date
)t ;
