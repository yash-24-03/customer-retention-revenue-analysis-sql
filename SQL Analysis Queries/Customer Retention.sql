# How many customers are repeat customers ?
SELECT COUNT(*) as repeat_customers
FROM (SELECT c.customer_unique_id
      FROM olist_orders_dataset o
               JOIN olist_customers_dataset c
                    ON o.customer_id = c.customer_id
      GROUP BY c.customer_unique_id
      HAVING count(o.order_id) > 1
) t;

# What % of customers place more than 1 order ?
SELECT (SUM(CASE WHEN total_orders > 1 THEN 1 ELSE 0 END) * 100.0)
    /COUNT(*) AS Percentage_of_Customers_more_than_1
    FROM (SELECT c.customer_unique_id,count(o.order_id) as total_orders
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
) t;

# Monthly retention rate
with monthly_customers as (
SELECT distinct c.customer_unique_id,
       DATE_FORMAT(order_purchase_timestamp, '%Y-%m-01')
 as month
from olist_orders_dataset o
join olist_customers_dataset c
on o.customer_id =c.customer_id
group by c.customer_unique_id,month)

SELECT m1.month,
       COUNT(DISTINCT m2.customer_unique_id)*100.0
            /COUNT(DISTINCT m1.customer_unique_id) AS monthly_retention_rate
FROM monthly_customers m1
LEFT JOIN monthly_customers m2
    ON m1.customer_unique_id = m2.customer_unique_id
    AND m2.month = DATE_ADD(m1.month, INTERVAL 1 MONTH)
GROUP BY m1.month
ORDER BY m1.month



