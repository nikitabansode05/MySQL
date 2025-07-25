-- 1. Creating a Stored Procedure for User Registration

use tflecommerce;

delimiter //
create procedure userRegistration(in username varchar(250),in pass varchar(50),in email varchar(50),in address varchar(200))
begin
	insert into users(username,password,email,address) values(username,pass,email,address);
end//
delimiter ;

call userRegistration("Nikita Bansode","pass@123","nikita@gmail.com","A/p Manchar");