# Average review score per category
SELECT
    t.product_category_name,
    ROUND(AVG(r.review_score), 2) AS average_review
FROM (
    SELECT DISTINCT
        i.order_id,
        pr.product_category_name
    FROM olist_order_items_dataset i
    JOIN olist_products_dataset pr
        ON pr.product_id = i.product_id
) t
JOIN olist_order_reviews_dataset r
    ON r.order_id = t.order_id
GROUP BY t.product_category_name;

# Does delivery delay impact reviews?
SELECT is_delayed, ROUND(AVG(review_score), 2) as avg_review
FROM (SELECT o.order_id,
             r.review_score,
             CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 'Delayed' ELSE 'On Time' END AS is_delayed
      FROM olist_orders_dataset o
               JOIN olist_order_reviews_dataset r
                    ON o.order_id = r.order_id
      WHERE o.order_status = 'delivered') t
GROUP BY is_delayed

# Cities with lowest ratings

SELECT c.customer_city, ROUND(AVG(r.review_score), 2) as rating
FROM olist_orders_dataset o
         JOIN olist_order_reviews_dataset r
              ON r.order_id = o.order_id
         JOIN olist_customers_dataset c
              ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY rating