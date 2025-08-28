

-- Most prolific actors
SELECT 
COUNT(film_actor.film_id) as totalFilms,
CONCAT(actor.first_name, ' ', actor.last_name) as actorName
FROM film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id
ORder BY totalFilms DESC
;


-- Revenue by Actor For The Month of June 2022
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
		GROUP BY 
			inventory.film_id
		
	) as film_revenue ON film_actor.film_id = film_revenue.film_id
	LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id;
