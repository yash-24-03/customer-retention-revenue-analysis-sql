# Average delivery time
SELECT AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp))as avg_delievery_time
FROM olist_orders_dataset
WHERE order_status = 'delivered';

#Orders delivered late vs on time
SELECT SUM(Late_Order) as Late_Order,
       SUM(On_Time)    as On_Time
FROM (SELECT order_id,
             (CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) as Late_Order,
             (CASE WHEN order_delivered_customer_date < order_estimated_delivery_date THEN 1 END) as On_Time
      FROM olist_orders_dataset
      WHERE order_status = 'delivered') t;

# Seller performance
WITH seller_metrics as (SELECT i.seller_id,
       count(distinct i.order_id)                  as total_order,
       ROUND(SUM(i.price), 2)                      as revenue,
       COUNT(DISTINCT CASE
                          WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
                              THEN i.order_id END) as late_order,
       ROUND(AVG(r.review_score), 2)               as avg_review
FROM olist_order_items_dataset i
         JOIN olist_orders_dataset o
              ON i.order_id = o.order_id
         JOIN olist_order_reviews_dataset r
              ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
GROUP BY i.seller_id
ORDER BY total_order desc, revenue desc, late_order, avg_review desc
) , normalized AS (
    SELECT
        seller_id,

        -- normalize positive metrics
        (total_order - MIN(total_order) OVER())
        / (MAX(total_order) OVER() - MIN(total_order) OVER()) AS order_score,

        (revenue - MIN(revenue) OVER())
        / (MAX(revenue) OVER() - MIN(revenue) OVER()) AS revenue_score,

        (avg_review - MIN(avg_review) OVER())
        / (MAX(avg_review) OVER() - MIN(avg_review) OVER()) AS review_score,

        -- normalize negative metric (invert it)
        1 - (
            (late_order - MIN(late_order) OVER())
            / (MAX(late_order) OVER() - MIN(late_order) OVER())
        ) AS delivery_score
    FROM seller_metrics
)
SELECT seller_id,
       ROUND(
               0.30 * order_score +
               0.30 * revenue_score +
               0.20 * delivery_score +
               0.20 * review_score
           , 3) AS seller_score
FROM normalized
ORDER BY seller_score DESC;
