/* Challenge - Joining on multiple tables

Write SQL queries to perform the following tasks using the Sakila database:*/

USE sakila;

# 1 - List the number of films per category.
SELECT * FROM category;
SELECT * FROM film_category;

SELECT c.name, COUNT(*)
FROM film_category fc
LEFT JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.name;

# 2 - Retrieve the store ID, city, and country for each store.
SELECT * FROM store;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;

SELECT *
FROM store s
INNER JOIN address a
ON s.address_id = a.address_id;

SELECT *#c.city
FROM address a
INNER JOIN city c
ON a.city_id = c.city_id;

SELECT co.country
FROM city c
INNER JOIN country co
ON c.country_id = co.country_id;


SELECT s.store_id, c.city, co.country
FROM store s
INNER JOIN address a
ON s.address_id = a.address_id
INNER JOIN city c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id;

# 3 - Calculate the total revenue generated by each store in dollars.
SELECT * #SUM(amount)
FROM payment;

SELECT st.store_id, COUNT(p.amount) revenue
FROM payment p
LEFT JOIN staff st
ON p.staff_id=st.staff_id
GROUP BY st.store_id;
# WHAT HAPPENS? THE VALUES DO NOT AMOUNT TO THE TOTAL VALUE

# 4 - Determine the average running time of films for each category.

SELECT * FROM film;
SELECT * FROM category;
SELECT * FROM film_category;

SELECT c.name, ROUND(AVG(film.length),2) avg_length
FROM film_category fc
LEFT JOIN category c
ON fc.category_id = c.category_id
INNER JOIN film
ON fc.film_id=film.film_id
GROUP BY c.name;




/* Bonus:

Identify the film categories with the longest average running time.
Display the top 10 most frequently rented movies in descending order.
Determine if "Academy Dinosaur" can be rented from Store 1.
Provide a list of all distinct film titles, along with their availability status in the inventory. Include a column indicating whether each title is 'Available' or 'NOT available.' Note that there are 42 titles that are not in the inventory, and this information can be obtained using a CASE statement combined with IFNULL."*/