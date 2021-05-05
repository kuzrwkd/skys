CREATE DATABASE IF NOT EXISTS `sample_db`;
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL ON sample_db.* TO 'user'@'%';
