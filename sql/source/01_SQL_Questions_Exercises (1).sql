-- Q1 How many customers are there in each state? Show the top 5 states.

select count(*) as customers, c.customer_state 
from customers c
group by c.customer_state
order by customers desc
limit 5;

-- Q2 How many distinct real customers (customer_unique_id) are there?

select count(distinct customer_unique_id) as uid
from customers;

-- Q3 Which payment type is used most, and what is its total payment value?

select * from order_payments op;

select op.payment_type, count(*) as total, sum(op.payment_value)
from order_payments op 
group by op.payment_type
order by total desc;

-- Q4 Count reviews for each score (1-5) and find the average score.

select * from order_reviews;

select count(*) as total_reviews, t.review_score, AVG(t.review_score) over() as average_score
from order_reviews t
group by t.review_score;

-- Q5 Find seller states with more than 50 sellers.

select * from sellers;

select s.seller_state, count(*) as total_sellers
from sellers s
group by s.seller_state
having count(*) > 50;

-- Q6 Calculate the average price and freight per item, rounded to 2 decimals.

select * from order_items oi;

select oi.product_id, round(avg(oi.price), 2), round(avg(oi.freight_value), 2)
from order_items oi
group by oi.product_id;