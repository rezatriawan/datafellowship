--1.Recommendations for films about 'Astronaut'.
select description from film;
select count(film.description) as total_recommend
from film where film.description like '%Astronaut%';

--2. Films with ratig 'R' and a replacement costt between $5 and $15
select count(film_id) as total_film
from film
where rating = 'R' and replacement_cost between 5 and 15;

--3.Total  payments every staff handle and the total amounts
select * from staff;
select * from payment;
select staff.staff_id , count(payment.payment_id) as total_payment, sum(payment.amount) as total_payment_amount
from staff
inner join payment on staff.staff_id = payment.staff_id
group by staff.staff_id;

--4. Average replacement cost
select film.rating, avg(replacement_cost)
from film
group by rating ;

--5  Customer Spent Amount
select 
customer.first_name, 
customer.last_name,
customer.email, 
sum(payment.amount) as total_payment_amount
from customer
left join payment on customer.customer_id = payment.customer_id
group by payment.amount, customer.first_name, 
customer.last_name,
customer.email
order by sum(payment.amount) desc
limit 5;

--6. Copies of every movie in each store
select distinct(a.title) as title, b.store_id as store_id, count(a.title) as copy 
from film as a 
inner join inventory as b on a.film_id = b.film_id
group by title, store_id
order by title;

--7. Customer who are eligible for credit card
select customer.customer_id, 
customer.first_name, 
customer.last_name,
customer.email,
count(customer.customer_id) as total_transaction
from customer
left join payment on customer.customer_id = payment.customer_id
group by customer.customer_id
order by total_transaction desc;


