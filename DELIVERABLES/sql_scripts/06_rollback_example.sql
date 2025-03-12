START TRANSACTION;
INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES (NOW(), 9999, 1, NULL, 1); -- Suponiendo que 9999 no existe
ROLLBACK;
