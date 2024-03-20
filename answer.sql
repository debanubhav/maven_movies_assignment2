use mavenmovies ;
-- question 1 --
select count(rental_id) from rental;
-- question 2--
select avg(rental_duration) from film;
-- question 3 --
select upper(first_name), upper(last_name) from customer ;
-- question 4 --
select rental_id, month(rental_date) from rental;
-- question 5--
select  customer_id ,count(rental_id) from rental group by customer_id;
-- question 6 --
select store.store_id, sum(amount) as s from payment 
join staff on payment.staff_id=staff.staff_id
join store on store.store_id=staff.store_id
group by store.store_id;
-- question 7--
select customer.first_name,customer.last_name , film.title from customer
join rental on rental.customer_id = customer.customer_id
join inventory on inventory.inventory_id= rental.inventory_id
join film on film.film_id=inventory.film_id;
-- question 8--
select actor.first_name,actor.last_name,film.title from actor 
join film_actor on film_actor.actor_id=actor.actor_id
join film on film.film_id=film_actor.film_id;

-- set 2 
-- question 1
select film_category.category_id,category.name,count(rental_id) from film_category
join inventory on inventory.film_id=film_category.film_id
join rental on rental.inventory_id=inventory.inventory_id
join category on category.category_id =film_category.category_id
group by category_id;

-- question 2==

select avg(rental_duration*rental_rate), original_language_id,language.name from film 
join language on language.language_id = film.language_id
group by original_language_id,language.name;

-- question 3 
select customer.first_name, customer.last_name, sum(amount) from customer
join rental on rental.customer_id= customer.customer_id
join payment on payment.rental_id=rental.rental_id
group by customer.first_name, customer.last_name;

-- question 4 --
select city,title from customer 
join address on address.address_id=customer.address_id
join city on city.city_id=address.city_id
join rental on rental.customer_id=customer.customer_id
join inventory on inventory.inventory_id=rental.inventory_id
join film on film.film_id=inventory.film_id
group by city,title;

-- question 5 
select count(title), film.title from rental 
join inventory on inventory.inventory_id=rental.inventory_id
join film on film.film_id= inventory.film_id
group by film.title
order by count(title) desc limit 5 ;

-- question 5
select count(customer_id) from customer where customer.store_id=1 and store_id=2; 


