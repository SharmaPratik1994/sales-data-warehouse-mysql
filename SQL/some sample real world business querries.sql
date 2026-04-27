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

### Moving average of december month from west Region

select region, order_date, total_sales, avg(total_sales) over( order by order_date rows between 1 preceding and current row) as moving_average
from (
select l.region, sum(f.sales) as total_sales,f.order_date
from dim_location l 
join facts f
on l.location_key = f.location_key
where region = "west"
and month(f.order_date) = 12
group by f.order_date
) t;

#### usage of CTEs to find out growth in sales in daily basis.
 with daily_sales as(
 select order_date, sum(sales) as total_sales
 from facts
 group by order_date
 )
 select order_date, total_sales,
 lag(total_sales) over (order by order_date) as previous_sales
 from daily_sales;
 
 
 ##### Retrieve the data of customers whose sales are greater than 10000 and who are from california
 
 select * 
 from dim_customers c
 join facts f 
 on c.customer_key = f.customer_key
 join dim_location l
 on l.location_key = f.location_key
 where f.sales > 10000 and l.state = "California";
 
 select * from dim_location;
 
 ### Top 5 product based on profits with city of the customers,
 
 select p.product_name, f.profit, l.city
 from dim_product p
 join facts f 
 on p.product_key = f.product_key
 join dim_location l 
 on l.location_key = f.location_key
order by f.profit desc 
limit 5;