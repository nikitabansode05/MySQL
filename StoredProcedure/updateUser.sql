-- 3. Creating a Stored Procedure for Updating User Information

DELIMITER //

CREATE PROCEDURE sp_UpdateUser(IN p_id INT,IN p_name VARCHAR(50),IN p_email VARCHAR(50),IN p_address VARCHAR(50),IN p_password VARCHAR(50))
BEGIN
	UPDATE users SET username=p_name ,email=p_email,password=p_password,address=p_address where id=p_id;
    SELECT id,username,password,email,address  FROM users WHERE id=p_id;
END//

DELIMITER ;

CALL sp_UpdateUser(21,"Ariana Grande","ariana@gmail.com","Las Vegas","pass@23");