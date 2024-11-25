
-- Top Selling Manager by Rentals
SELECT
	COUNT(rental.rental_id) as rentals, 
	staff.staff_id, 
	CONCAT(staff.first_name, ' ', staff.last_name) as ManagerName
FROM
	rental
	INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
	INNER JOIN store ON inventory.store_id = store.store_id
	INNER JOIN staff ON store.manager_staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY rentals DESC
LIMIT 1;


-- Top manager by revenue
SELECT
	SUM(payment.amount) as revenue, 
	staff.staff_id, 
	CONCAT(staff.first_name, ' ', staff.last_name) as ManagerName
FROM
	rental
	INNER JOIN payment ON rental.rental_id = payment.rental_id
	INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
	INNER JOIN store ON inventory.store_id = store.store_id
	INNER JOIN staff ON store.manager_staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY revenue DESC
LIMIT 1;