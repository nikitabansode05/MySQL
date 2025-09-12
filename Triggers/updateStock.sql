-- 1. Trigger to Update Stock After an Order is Placed

DELIMITER //
CREATE TRIGGER update_stock_after_order
AFTER INSERT ON order_items
FOR EACH ROW
	BEGIN
		UPDATE products p
        JOIN  order_items oi ON p.id=oi.item_id
        SET p.stock=p.stock-NEW.quantity
        WHERE p.id=NEW.item_id;
    END //
DELIMITER ;

