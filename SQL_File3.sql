#Identify the highest-priced pizza.
SELECT 
    pizzas.price AS 'Maximum Price Pizza', pizza_types.name
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    order by pizzas.price desc limit 1;