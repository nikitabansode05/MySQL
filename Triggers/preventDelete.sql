-- 2. Trigger to Prevent Deletion of a Product with Existing Orders

-- DELIMITER //

-- CREATE TRIGGER prevent_deletion
-- BEFORE DELETE ON products
-- FOR EACH ROW
-- 	BEGIN
--     DELETE p FROM products
-- 		JOIN products p ON oi.order_item_id=p.id
-- 		JOIN order_items oi ON o.order_id=oi.id
-- 		WHERE o.status="Delivered";
--     END //
    
-- DELIMITER ;

DELIMITER //
CREATE TRIGGER prevent_deletion
BEFORE DELETE ON products
FOR EACH ROW
	BEGIN
		IF EXISTS(
			SELECT 1
            FROM order_items oi 
            WHERE oi.item_id=OLD.id
        )THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT="Cannot delete the product";
        END IF;
    END//
DELIMITER ;