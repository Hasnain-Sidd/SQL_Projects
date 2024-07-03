#Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(Day_Wise_Order)) as Average_Order from
(select orders.order_date as Din,sum(order_details.quantity) as Day_Wise_Order from orders
join order_details on orders.order_id=order_details.order_id group by Din) as Quantiy_Order;