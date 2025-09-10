-- 4. Creating a Stored Procedure for Applying a Discount Code

DELIMITER //
CREATE PROCEDURE applyDiscount( p_order_id INT, p_discount_code VARCHAR(50))
BEGIN
	DECLARE v_total INT;
    DECLARE v_discount_percentage VARCHAR(50);
    
    SELECT discount_percentage INTO v_discount_percentage FROM discount_codes WHERE code = p_discount_code AND NOW() BETWEEN start_date AND end_date;
    SELECT total_amount INTO v_total FROM orders WHERE id=p_order_id;
    
    SET v_total = v_total - (v_total*(v_discount_percentage/100));
    
    UPDATE orders SET total_amount=v_total WHERE id=p_order_id;
END //
DELIMITER ;

CALL applyDiscount(1,"DIWALI21");