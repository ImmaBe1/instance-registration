CREATE USER IF NOT EXISTS 'newuser'@'172.27.1.7' IDENTIFIED BY 'secretpassword';
CREATE DATABASE IF NOT EXISTS hue;
grant all on hue.* to 'newuser'@'172.27.1.7';
flush privileges; 
use hue;
CREATE TABLE IF NOT EXISTS MyGuests (id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,firstname VARCHAR(30) NOT NULL,lastname VARCHAR(30) NOT NULL,email VARCHAR(50));
