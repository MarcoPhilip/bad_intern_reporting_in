

-- Most prolific actors
SELECT 
	COUNT(film_actor.film_id) as films,
	CONCAT(actor.first_name, ' ', actor.last_name) as actorName
FROM 
	film_actor
	LEFT JOIN actor on film_actor.actor_id = actor.actor_id
	GROUP BY actor.actor_id
ORDER BY films DESC;


-- Revenue Actor Date Range
SELECT 
	actor.actor_id,
	CONCAT(actor.first_name, ' ', actor.last_name) as name,
	SUM(film_revenue.total_revenue) as total_revenue
	FROM film_actor
	LEFT JOIN (
		SELECT 
			inventory.film_id,
			SUM(payment.amount) as total_revenue
		FROM payment
			INNER JOIN rental ON payment.rental_id = rental.rental_id
			INNER JOIN inventory ON rental.inventory_id = rental.inventory_id
		WHERE 
			payment.payment_date > TIMESTAMP '2022-06-01 00:00:00'
			AND payment.payment_date < TIMESTAMP '2022-06-01 00:00:00' + INTERVAL '1 MONTH'
		GROUP BY 
			inventory.film_id
		
	) as film_revenue ON film_actor.film_id = film_revenue.film_id
	LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id;
