-- Assignment -1

use sakila;
-- 1.1Rentals by Customer Geography Contribution of Countries & Cities (in hierarchy) by rental amount - Treemap (or Heatmap) & sql query  
Select Distinct city, country.country,payment.amount  
from customer 
inner join address on customer.address_id=address.address_id  
inner join city on city.city_id=address.city_id and customer.address_id=address.address_id      
inner join country on city.country_id=country.country_id 
inner join rental ON customer.customer_id = rental.customer_id  
inner join payment ON payment.rental_id = rental.rental_id AND payment.customer_id = customer.customer_id  
GROUP BY customer.customer_id ORDER BY city.city,country.country;  

-- 1.2 Rental amounts by countries for PG & PG-13 rated films - bar chart & sql query 
select country.country, count(inventory.film_id), sum(payment.amount)  
from country 
inner join city on city.country_id=country.country_id 
inner join address on address.city_id=city.city_id     
inner join customer on customer.address_id=address.address_id     
inner join payment on payment.customer_id=customer.customer_id     
inner join rental on payment.rental_id=rental.rental_id     
inner join inventory on rental.inventory_id=inventory.inventory_id     
inner join film on inventory.film_id=film.film_id  
Where film.rating='PG' or film.rating='PG-13' 
group by country.country 
ORDER BY count(inventory.film_id) ; 
 
-- 1.3 Top 20 cities by number of customers who rented - bar chart & sql query 
select city.city, count(customer.customer_id) 
from city 
inner join address on address.city_id=city.city_id 
inner join customer on customer.address_id=address.address_id      
inner join rental on rental.customer_id=customer.customer_id 
GROUP BY city.city_id 
ORDER BY count(customer.customer_id) 
Limit 20 ; 
 
-- 1.4 Top 20 cities by number of films rented - bar chart & sql query 
select  city.city_id,city.city, count(inventory.film_id) 
from city 
inner join address on address.city_id=city.city_id 
inner join customer on customer.address_id=address.address_id      
inner join rental on rental.customer_id=customer.customer_id     
inner join inventory on rental.inventory_id=inventory.inventory_id     
inner join film on inventory.film_id=film.film_id  
GROUP BY city.city_id 
ORDER BY count(inventory.film_id) desc 
Limit 20 ; 
 
-- 1.5 Rank cities by average rental cost  
Select city.city,avg(payment.amount)  
from customer 
inner join address on customer.address_id=address.address_id  
inner join city on city.city_id=address.city_id and customer.address_id=address.address_id      
inner join country on city.country_id=country.country_id 
inner join rental ON customer.customer_id = rental.customer_id  
inner join payment ON payment.rental_id = rental.rental_id AND payment.customer_id = customer.customer_id  
GROUP BY city.city 
ORDER BY city.city; 

-- 2.1 Film categories by rental amount (ranked) & rental quantity – tabular & sql query 
Select name, sum(payment.amount) , count(category.category_id) 
from category  
inner join film_category on film_category.category_id=category.category_id 
inner join film on film_category.film_id=film.film_id 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
group by name 
order by count(category.category_id),sum(payment.amount) desc; 
 
 
-- 2.2 Film categories by rental amount (ranked) – bar chart & sql query 
Select name, sum(payment.amount) 
from category  
inner join film_category on film_category.category_id=category.category_id 
inner join film on film_category.film_id=film.film_id 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
group by name order by sum(payment.amount) desc; 
 
 
-- 2.3 Film categories by average rental amount (ranked) & – tabular & sql query 
Select name, avg(payment.amount)  
from category  
inner join film_category on film_category.category_id=category.category_id 
inner join film on film_category.film_id=film.film_id 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
group by name order by avg(payment.amount) desc ; 
 
-- 2.4 Contribution of Film Categories by number of customers - Treemap (or Heatmap) & sql  
Select name,count(customer.customer_id)  
from category  
inner join film_category on film_category.category_id=category.category_id 
inner join film on film_category.film_id=film.film_id 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join customer on rental.customer_id=customer.customer_id 
group by name 
order by count(customer.customer_id) desc ; 
 
-- 2.5 Contribution of Film Categories by rental amount - Treemap (or Heatmap) & sql query 
Select name, sum(payment.amount)  
from category  
inner join film_category on film_category.category_id=category.category_id 
inner join film on film_category.film_id=film.film_id 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
inner join customer on payment.customer_id=customer.customer_id 
group by name order by sum(payment.amount) desc ; 

-- 3.1 List Films with rental amount, rental quantity, rating, rental rate, replacement cost and category name – tabular & sql query 

-- VIEW created 
CREATE VIEW film_info AS  
Select sum(payment.amount),count(inventory.film_id) ,film.film_id 
from film  
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
group by film.film_id order by count(inventory.film_id) desc ,sum(payment.amount) desc ; 
 
 
-- VIEW 2 
Create view `film_rate`
AS 
Select rating, rental_rate, replacement_cost, category.name, film.film_id 
from film 
inner join film_category on film_category.film_id=film.film_id 
inner join category on category.category_id=film_category.category_id 
group by film.film_id order by category.name; 
 
-- Final Table that we want 
 
select rating, rental_rate, replacement_cost, name ,film_info.total ,film_info.amount 
from film_rate 
inner join film_info on film_rate.film_id=film_info.film_id  
group by film_rate.name 
order by name; 
 
-- 3.2 List top 10 Films by rental amount (ranked) – bar chart & sql query 

select title, sum(payment.amount), count(inventory.film_id) 
from film 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
group by title 
order by sum(payment.amount) desc 
limit 10; 
 
-- 3.3 List top 20 Films by number of customers (ranked) – bar chart & sql query 

select title, sum(payment.amount), count(customer.customer_id) 
from film 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
inner join customer on customer.customer_id=payment.customer_id 
group by film.film_id 
order by count(customer.customer_id) desc 
limit 20; 
 
 
-- 3.4 List Films with the word “punk” in title with rental amount and number of customers – tabular & sql query 

select title, sum(payment.amount), count(customer.customer_id) 
from film 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
inner join customer on customer.customer_id=payment.customer_id 
where film.title like '%punk%' 
group by film.film_id 
order by count(customer.customer_id) desc; 
 
-- 3.5 Contribution by rental amount for films with a documentary category - Treemap (or Heatmap) & sql query 

-- VIEW created 1 
Create view `film_amount` AS 
select title, sum(payment.amount) as amount, film.film_id 
from film 
inner join inventory on inventory.film_id=film.film_id 
inner join rental on inventory.inventory_id=rental.inventory_id 
inner join payment on payment.rental_id=rental.rental_id 
group by film.film_id 
order by sum(payment.amount) desc; 
 
-- VIEW Created 2 
CREATE VIEW `film_documentary` AS 
Select title, film.film_id 
from film 
inner join film_category on film_category.film_id=film.film_id 
inner join category on category.category_id=film_category.category_id 
where category.name="Documentary" 
group by film.film_id 
order by film.film_id; 
 
-- Query for joining views 
select film_amount.title, amount 
from film_amount 
inner join film_documentary on film_documentary.film_id=film_amount.film_id 
order by amount desc 
limit 20; 
 
-- 4.1 List Customers (Last name, First Name) with rental amount, rental quantity, active status, country and city – tabular & sql query 
select first_name,last_name,active as active_status,country.country,city.city ,sum(payment.amount), count(inventory.film_id), customer.customer_id 
from customer 
inner join address on customer.address_id=address.address_id  
inner join city  on city.city_id=address.city_id and customer.address_id=address.address_id  
inner join country on city.country_id=country.country_id 
inner join rental ON customer.customer_id = rental.customer_id  
inner join payment ON payment.rental_id = rental.rental_id AND payment.customer_id = customer.customer_id 
inner join inventory  on inventory.inventory_id=rental.inventory_id 
group by customer.customer_id 
order by customer.first_name; 

-- 4.2 List top 10 Customers (Last name, First Name) by rental amount (ranked) for PG & PG-13 rated films – bar chart & sql query 
select first_name, last_name, sum(payment.amount) 
from customer 
inner join payment on payment.customer_id=customer.customer_id 
inner join rental on payment.rental_id=rental.rental_id 
inner join inventory on rental.inventory_id=inventory.inventory_id 
inner join film on inventory.film_id=film.film_id  
Where film.rating='PG' or film.rating='PG-13' 
group by customer.customer_id 
order by sum(payment.amount) desc 
limit 10; 

-- 4.3 Contribution by rental amount for customers from France, Italy or Germany - Treemap (or Heatmap) & sql query 

select first_name,last_name,country.country, sum(payment.amount) 
from customer 
inner join address on customer.address_id=address.address_id  
inner join city on city.city_id=address.city_id and customer.address_id=address.address_id  
inner join country on city.country_id=country.country_id 
inner join rental ON customer.customer_id = rental.customer_id  
inner join payment ON payment.rental_id = rental.rental_id AND payment.customer_id = customer.customer_id 
inner join inventory  on inventory.inventory_id=rental.inventory_id 
where country.country="France" or country.country="Italy" or country.country="Germany" 
group by customer.customer_id 
order by sum(payment.amount); 
 
 
-- 4.4 List top 20 Customers (Last name, First Name) by rental amount (ranked) for comedy films – bar chart & sql query 
select first_name, last_name, sum(payment.amount) 
from customer 
inner join payment on payment.customer_id=customer.customer_id 
inner join rental on payment.rental_id=rental.rental_id 
inner join inventory on rental.inventory_id=inventory.inventory_id 
inner join film on inventory.film_id=film.film_id  
inner join film_category on film_category.film_id=film.film_id 
inner join category on film_category.category_id=category.category_id 
Where category.name="Comedy" 
group by customer.customer_id 
order by sum(payment.amount) desc 
limit 20; 

-- 4.5 List top 10 Customers (Last name, First Name) from China by rental amount (ranked) for films that have replacement costs greater than $24 – bar chart & sql query 
 
select first_name,last_name, film.replacement_cost, sum(payment.amount) 
from customer 
inner join address on customer.address_id=address.address_id  
inner join city  on city.city_id=address.city_id and customer.address_id=address.address_id  
inner join country on city.country_id=country.country_id 
inner join rental ON customer.customer_id = rental.customer_id  
inner join payment ON payment.rental_id = rental.rental_id AND payment.customer_id = customer.customer_id 
inner join inventory  on inventory.inventory_id=rental.inventory_id 
inner join film on inventory.film_id=film.film_id  
where country.country="China" and film.replacement_cost > 24 
group by customer.customer_id 
order by sum(payment.amount); 

-- ---------


 
 
 
 