-- 6. Creating a Stored Procedure for Low Stock Alerts

DELIMITER //
CREATE PROCEDURE lowStockAlert(IN p_threshhold int )
	BEGIN
		SELECT * FROM products WHERE stock<p_threshhold;
    END //
DELIMITER ;

CALL lowStockAlert(50);