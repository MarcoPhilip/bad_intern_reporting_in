-- Overdue Movies
SELECT
	CONCAT(customer.last_name, ', ', customer.first_name) AS customer,
	address.phone,
	film.title
FROM
	rental
	INNER JOIN customer ON rental.customer_id = customer.customer_id
	INNER JOIN address ON customer.address_id = address.address_id
	INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
	INNER JOIN film ON inventory.film_id = film.film_id
WHERE
	rental.return_date IS NULL
	AND rental_date < CURRENT_DATE
ORDER BY
	title;

-- Value Overdue
SELECT
	film.film_id,
	film.title,
	COUNT(film.film_id) as Copies,
	SUM(film.replacement_cost) as ReplacementValue
FROM
	rental
	INNER JOIN customer ON rental.customer_id = customer.customer_id
	INNER JOIN address ON customer.address_id = address.address_id
	INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
	INNER JOIN film ON inventory.film_id = film.film_id
WHERE
	rental.return_date IS NULL
	AND rental_date < CURRENT_DATE
GROUP BY
	film.film_id
ORDER BY
	ReplacementValue DESC, Copies DESC;


-- Overdue value by category
SELECT
	category.name,
	COUNT(category.category_id) as Copies,
	SUM(film.replacement_cost) as ReplacementValue
FROM
	rental
	INNER JOIN customer ON rental.customer_id = customer.customer_id
	INNER JOIN address ON customer.address_id = address.address_id
	INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
	INNER JOIN film ON inventory.film_id = film.film_id
	INNER JOIN film_category ON film.film_id = film_category.film_id
	INNER JOIN category ON film_category.category_id = category.category_id
WHERE
	rental.return_date IS NULL
	AND rental_date < CURRENT_DATE
GROUP BY
	category.category_id
ORDER BY
	ReplacementValue DESC, Copies DESC;
