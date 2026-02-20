# Total revenue per month
Select DATE_FORMAT(order_purchase_timestamp, '%y-%m-01') as Month, FLOOR(SUM(p.payment_value)) as total_revenue
FROM olist_order_payments_dataset p
         JOIN olist_orders_dataset o
              ON o.order_id = p.order_id
GROUP BY Month
ORDER BY Month

# Average order value (AOV)
SELECT FLOOR(SUM(payment_value)/COUNT(distinct o.order_id)) as average_order_value
    FROM olist_order_payments_dataset p
        JOIN olist_orders_dataset o
            ON o.order_id = p.order_id

# Revenue by payment type
select payment_type,ROUND(sum(payment_value),2) as revenue
FROM olist_order_payments_dataset
GROUP BY payment_type

