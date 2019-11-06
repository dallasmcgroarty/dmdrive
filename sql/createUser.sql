/*create user script
  needed to use mysql_native_password otherwise i couldnt connect to the database using mysqli */
CREATE USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'user123';
GRANT ALL ON dmdrive.* TO 'user'@'localhost';
FLUSH PRIVILEGES;