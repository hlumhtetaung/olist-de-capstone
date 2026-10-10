-- Q1 How many customers are there in each state? Show the top 5 states.

select count(*) as customers, c.customer_state 
from customers c
group by c.customer_state
order by customers desc
limit 5;

-- Q2 How many distinct real customers (customer_unique_id) are there?

select count(distinct customer_id) as uid
from customers;

-- Q3 Which payment type is used most, and what is its total payment value?

select * from order_payments op;

select op.payment_type, count(*) as total, sum(op.payment_value)
from order_payments op 
group by op.payment_type
order by total desc;