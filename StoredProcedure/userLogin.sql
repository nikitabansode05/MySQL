-- 2. Creating a Stored Procedure for User Login
use tflecommerce;

DELIMITER //
CREATE PROCEDURE sp_UserLogin(IN p_username VARCHAR(50),IN p_password VARCHAR(50))
BEGIN
	SELECT id,username,email,address FROM users where password=p_password AND username=p_username;
END//
DELIMITER ;

CALL sp_UserLogin("Nikita Bansode","pass@123");