-- 7. Creating a Stored Procedure for Product Reviews

DELIMITER //
CREATE PROCEDURE productReview(p_product_id INT,p_user_id INT,p_rating INT,p_review VARCHAR(50))
	BEGIN
		INSERT INTO reviews(product_id,user_id,rating,review_text) VALUES(p_product_id,p_user_id,p_rating,p_review);
        
    END //  
DELIMITER ;

CALL productReview(1,2,5,"Nice");
