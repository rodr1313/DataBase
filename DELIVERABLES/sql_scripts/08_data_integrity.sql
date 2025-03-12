ALTER TABLE rental ADD CONSTRAINT fk_inventory FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id);

CREATE TRIGGER check_inventory BEFORE INSERT ON rental
FOR EACH ROW BEGIN
    DECLARE available INT;
    SELECT COUNT(*) INTO available FROM inventory WHERE inventory_id = NEW.inventory_id;
    IF available = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No stock available';
    END IF;
END;
