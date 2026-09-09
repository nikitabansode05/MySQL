DELIMITER //
CREATE PROCEDURE add_to_cart(IN in_user_id INT,IN in_product_id INT,IN in_quantity INT,IN in_item_image VARCHAR(200))
	BEGIN
		DECLARE v_cart_id INT DEFAULT 0;
        DECLARE v_customer_id INT DEFAULT 0;
        DECLARE v_product_id INT DEFAULT 0;
        DECLARE v_quantity INT DEFAULT 0;
        DECLARE v_stock INT DEFAULT 0;
        
        SELECT stock INTO v_stock FROM products WHERE id=in_product_id;
        
	    IF in_quantity > v_stock THEN 
			 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ="ITEM NOT AVAILABLE";
        ELSE
			SELECT customer_id INTO v_customer_id FROM cart WHERE customer_id=in_user_id;
			IF v_customer_id > 0 THEN 
				SELECT ci.cart_id INTO v_cart_id FROM cart_items ci JOIN cart c ON c.cart_id=ci.cart_id WHERE c.customer_id=in_user_id;
				SELECT product_id INTO v_product_id FROM cart_items WHERE product_id=in_product_id;
				
				IF v_product_id > 0 THEN 
					SELECT quantity INTO v_quantity FROM cart_items WHERE product_id=in_product_id;
					SET v_quantity=v_quantity+in_quantity;
					UPDATE cart_items SET quantity=v_quantity WHERE cart_id=v_cart_id AND v_product_id=in_product_id;
					
				ELSE 
					INSERT INTO cart_items(cart_id,product_id,quantity,ItemImage) VALUES(v_cart_id,in_product_id,in_quantity,in_item_image); 
				END IF;
			ELSE 
				INSERT INTO cart(customer_id)  VALUES (in_user_id);
				SELECT cart_id INTO v_cart_id FROM cart WHERE customer_id=in_user_id;
				INSERT INTO cart_items(cart_id,product_id,quantity,ItemImage) VALUES (v_cart_id,in_product_id,in_quantity,in_item_image);
			END IF;
		END IF;
    END //
DELIMITER ;

CALL add_to_cart(5,3,2,'img');
CALL add_to_cart(5,3,1,'img');

