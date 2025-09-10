-- 5. Creating a Stored Procedure for Retrieving Order Details

DELIMITER //
CREATE PROCEDURE orderDetails(p_order_id INT)
BEGIN
	SELECT oi.order_id ,oi.quantity ,o.order_date ,o.shipping_address,o.total_amount,o.shipping_date,o.status,o.id,p.name AS product_name
    FROM orders o 
    JOIN order_items oi ON o.id=oi.order_id
    JOIN products p ON oi.item_id=p.id
    WHERE o.id=p_order_id; 
END //
DELIMITER ;

CALL orderDetails(1);