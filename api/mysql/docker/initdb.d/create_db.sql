CREATE DATABASE IF NOT EXISTS `skys`;
CREATE USER 'skys'@'%' IDENTIFIED BY 'password';
GRANT ALL ON skys.* TO 'skys'@'%';
