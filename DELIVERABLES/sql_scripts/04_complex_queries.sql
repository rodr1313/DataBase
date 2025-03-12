-- Customers who rented a film in the last 30 days
SELECT DISTINCT customer.* FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
WHERE rental_date >= NOW() - INTERVAL 30 DAY;

-- Most rented film
SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 1;

-- Total revenue per store
SELECT store.store_id, SUM(payment.amount) AS total_revenue
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;
