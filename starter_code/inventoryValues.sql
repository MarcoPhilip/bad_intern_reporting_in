

-- Inventory Value
-- SELECT 
-- 	COUNT(film.film_id) as inventory_value
-- FROM 
-- 	inventory
-- 	LEFT JOIN store ON inventory.store_id = store.store_id
-- 	LEFT JOIN film ON inventory.film_id = film.film_id
-- 	LEFT JOIN address ON store.address_id = address.address_id
-- 	LEFT JOIN city ON address.city_id = city.city_id
-- GROUP BY film.film_id;

SELECT 
	store.store_id,
	address.address,
	address.address2,
	city.city,
	address.postal_code,
	SUM(film.replacement_cost) as inventory_value
FROM 
	inventory
	LEFT JOIN store ON inventory.store_id = store.store_id
	LEFT JOIN film ON inventory.film_id = film.film_id
	LEFT JOIN address ON store.address_id = address.address_id
	LEFT JOIN city ON address.city_id = city.city_id
GROUP BY store.store_id, address.address_id, city.city;

-- Replacement Costs by Actor
SELECT 
	film_actor.actor_id,
	SUM(fi.replacement_cost) as replacementCost,
	COUNT(film.film_id) as filmCount,
	actor.first_name,
	actor.last_name
FROM 
	film_actor
	LEFT JOIN film on film_actor.film_id = film.film_id
	LEFT JOIN (SELECT inventory.film_id, 
		SUM(film.replacement_cost) as replacement_cost 
		FROM inventory
		LEFT JOIN film on inventory.film_id = film.film_id
		GROUP BY inventory.film_id
	) AS fi ON fi.film_id = film.film_id
	GROUP BY actor.actor_id

