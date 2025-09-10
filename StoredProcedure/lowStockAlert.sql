-- 6. Creating a Stored Procedure for Low Stock Alerts

DELIMITER //
CREATE PROCEDURE lowStockAlert()
	BEGIN
		SELECT * FROM products WHERE stock<50;
    END //
DELIMITER ;

CALL lowStockAlert();