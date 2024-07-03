#Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(orders.order_time) AS Hourly,
    COUNT(orders.order_id) AS 'Total Orders'
FROM
    orders
GROUP BY Hourly;
