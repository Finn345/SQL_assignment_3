-- 1. List all customers from texas (use joins)
select customer.first_name, customer.last_name, address, district 
from customer
full join address
on customer.address_id = address.address_id
where district is ;


--2. Get all customers who paid anything above 6.99
select amount, first_name, last_name from payment, customer
where amount > 6.99;

-- 3. Show all customer names who have made payments over 175(using subqueries)
select * from customer
where customer_id in( 
	select customer_id from payment
	group by customer_id
	having sum(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

-- 5. Which staff members have the most transactions
select * from staff;

select count(*) as sfaff
from rental
where staff_id in (1,2)
group by staff_id
order by staff_id

-- 6. How many movies of each rating are there?
 select rating, count(*) as rating_count
 from film
 where rating in('G', 'PG', 'R', 'NC-17')
 group by rating
 order by rating_count;
 
-- 7. Show all customers who have made a single payment above 6.99 (Use Subqueries)
select first_name, last_name, customer_id from customer 
where customer_id in ( 
	select customer_id from payment
	group by customer_id
	having count(*) = 1 and sum(amount) > 6.99
);

-- 8. How many free rentals did our store give away?
select payment.rental_id from payment
group by rental_id
having max(amount) = 0;