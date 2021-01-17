SELECT user_id, 
COUNT(orders.order_id) AS total_orders, 
SUM(orders.box) AS total_boxes_ordered,
SUM(IF(orders.lunch_type="Deluxe Lunch",orders.box,0)) AS total_deluxe_boxes,
SUM(IF(orders.lunch_type="Basic Lunch",orders.box,0)) AS total_basic_boxes,
SUM(IF(orders.lunch_type="Healthy Lunch",orders.box,0)) AS total_healthy_boxes,
SUM(deliveries.box) AS total_box_delivered,
(SUM(orders.box) - SUM(deliveries.box)) AS box_remaining,
SUM(cashbacks.cashback) AS total_cashback

FROM orders
LEFT JOIN deliveries ON orders.order_id=deliveries.order_id
LEFT JOIN cashbacks ON deliveries.delivery_id=cashbacks.delivery_id
GROUP BY user_id