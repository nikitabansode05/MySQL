DELIMITER //
CREATE PROCEDURE remove_from_cart(IN in_product_id INT,IN in_user_id INT)
	BEGIN
		DECLARE v_cart_id INT DEFAULT 0;
        DECLARE v_after_deletion_cart_id INT DEFAULT 0;
        DECLARE v_customer_id INT DEFAULT 0;
        DECLARE v_product_quantity INT DEFAULT 0;
        
        SELECT id INTO v_customer_id FROM users WHERE id=in_user_id;
        
        IF v_customer_id = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="Customer does'nt exist";
        ELSE
			SELECT cart_id INTO v_cart_id FROM cart WHERE customer_id=in_user_id;
            
            IF v_cart_id = 0 THEN 
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="Customer does'nt have cart";
            ELSE
				SELECT quantity INTO v_product_quantity FROM cart_items WHERE cart_id = v_cart_id;
                SET v_product_quantity=v_product_quantity-1;
                
                IF v_product_quantity <=0 THEN
					DELETE FROM cart_items WHERE product_id=in_product_id AND cart_id=v_cart_id;
				ELSE
					UPDATE cart_items SET quantity = v_product_quantity WHERE cart_id = v_cart_id AND product_id=in_product_id;
                END IF;
				
				SELECT cart_id INTO v_after_deletion_cart_id FROM cart_items WHERE cart_id=v_cart_id;
				
				 IF v_after_deletion_cart_id=0 THEN 
					 DELETE FROM cart WHERE cart_id=v_after_deletion_cart_id;
				 END IF;
			END IF;
        END IF;
    END //
DELIMITER ;

CALL remove_from_cart(9,2);

DROP PROCEDURE remove_from_cart;
-- ivt isr -bios
SHOW PROCEDURE STATUS WHERE db = 'tflshoppingecommerce';
SHOW PROCEDURE STATUS LIKE '%pattern%';
SHOW PROCEDURE STATUS LIKE '%cart%';