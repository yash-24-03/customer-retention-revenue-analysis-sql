# Top 10 product categories by revenue
SELECT pr.product_category_name,ROUND(SUM(p.payment_value),2) as revenue
FROM olist_order_payments_dataset p
JOIN olist_order_items_dataset d
    ON p.order_id = d.order_id
JOIN olist_products_dataset pr
    ON pr.product_id = d.product_id
GROUP BY pr.product_category_name
ORDER BY revenue desc
LIMIT 10;

# Categories with highest cancellation rate
SELECT p.product_category_name, count(distinct case when o.order_status = 'canceled' THEN 1 END)
/count(distinct o.order_status) as canceled_rate
FROM olist_order_items_dataset i
         JOIN olist_products_dataset p
              ON i.product_id = p.product_id
         JOIN olist_orders_dataset o
              ON i.order_id = o.order_id
GROUP BY p.product_category_name
HAVING canceled_rate !=0
order by canceled_rate desc

# Best selling products
SELECT pr.product_category_name, COUNT(i.product_id) as best_selling
FROM olist_products_dataset pr
         JOIN olist_order_items_dataset i
              ON i.product_id = pr.product_id
GROUP BY pr.product_category_name
ORDER BY best_selling desc
LIMIT 5;