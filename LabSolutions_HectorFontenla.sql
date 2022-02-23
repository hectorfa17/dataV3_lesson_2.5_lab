USE sakila;
#Select all the actors with the first name ‘Scarlett’.
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'Scarlett'; 

#How many films (movies) are available for rent and how many films have been rented?
SELECT count(film_id) FROM inventory;

#What are the shortest and longest movie duration? 
#Name the values max_duration and min_duration.
SELECT MIN(length) as min_duration, MAX(length) as max_duration from FILM;

#What's the average movie duration expressed in format (hours, minutes)?
SELECT TIME_FORMAT(AVG(length), "%H %i") FROM film;
SELECT length FROM film;
#How many distinct (different) actors' last names are there?
SELECT distinct(last_name) FROM actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
SELECT MIN(payment_date), MAX(payment_date), DATEDIFF(MIN(payment_date), MAX(last_update)) FROM payment;
SELECT payment_date FROM payment;

#Show rental info with additional columns month and weekday. Get 20 results.
SELECT * , DAYNAME(last_update), MONTHNAME(last_update) FROM RENTAL
LIMIT 20;

#Add an additional column day_type with values 'weekend' and 'workday' 
#depending on the rental day of the week.
SELECT *,
CASE
WHEN DAYOFWEEK(rental_date) BETWEEN "1" AND "5" then 'workday'
WHEN DAYOFWEEK(rental_date) BETWEEN "6" AND "7" then 'weekend'
#Else 'weekend'
END as day_type
FROM rental;

#Get release years
SELECT distinct(release_year) FROM film;

#Get all films with ARMAGEDDON in the title.
SELECT title FROM film
WHERE title LIKE '%ARMAGEDDON%';

#Get all films which title ends with APOLLO.
SELECT title FROM film
WHERE title LIKE '%APOLLO';

#Get 10 the longest films.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

#How many films include Behind the Scenes content?
SELECT title, special_features FROM film
WHERE special_features LIKE '%Behind the Scenes%'