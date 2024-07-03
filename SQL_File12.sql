#Analyze the cumulative revenue generated over time.
select order_date,sum(Revenue_Generated) over (order by  order_date) as Cum_Revenue
from (select orders.order_date, round(sum( order_details.quantity * pizzas.price ),2) 
as Revenue_Generated from 
orders join order_details on orders.order_id=order_details.order_id 
join pizzas on order_details.pizza_id=pizzas.pizza_id 
group by orders.order_date) as Revenue;