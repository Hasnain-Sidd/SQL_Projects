
#Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
   (sum(order_details.quantity * pizzas.price) / (select SUM(order_details.quantity * pizzas.price) 
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id) ) * 100 as Revenue_Generated

FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category

ORDER BY  Revenue_Generated;