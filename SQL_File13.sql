#Determine the top 3 most ordered pizza types based on revenue for each pizza category
select name,Revenue_Generated from
(select category,
name,Revenue_Generated, rank() over (partition by category order by Revenue_Generated desc) as Ranking
from
(SELECT 
    pizza_types.category,pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS Revenue_Generated
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category,pizza_types.name) as A) as B
where Ranking<=3;
