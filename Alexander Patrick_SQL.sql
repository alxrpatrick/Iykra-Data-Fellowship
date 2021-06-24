--1
SELECT COUNT(*)
FROM film
WHERE description like '%stronaut%'

--2
SELECT COUNT(*)
FROM film
WHERE rating = 'R' AND replacement_cost > 5 AND replacement_cost < 15

--3
select CONCAT(first_name, ' ', last_name) as staff_name, count(amount) as payment_num, sum(amount) as payment_sum 
from staff st
	join payment py
	on st.staff_id = py.staff_id
GROUP BY first_name, last_name

--4
SELECT rating, AVG(replacement_cost)::NUMERIC(10,2) as rc_avg
FROM film
GROUP BY rating

--5
SELECT CONCAT(first_name, ' ', last_name) as customer_name, email, sum(amount) as amount
FROM customer cs
	JOIN payment py
	ON cs.customer_id = py.customer_id
GROUP BY first_name, last_name, email
ORDER BY amount desc
limit 5

--6
SELECT st.store_id, count(inventory_id) as movies
FROM store st
	JOIN inventory i
	ON st.store_id = i.store_id
GROUP BY st.store_id

--7
SELECT CONCAT(first_name, ' ', last_name) as customer_name, email, count(amount) as payment_count
FROM customer cs
	JOIN payment py
	ON cs.customer_id = py.customer_id
GROUP BY first_name, last_name, email
HAVING count(amount) >= 40
