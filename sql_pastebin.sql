# The following is the DDL for initialising database for this project.
# There are differences in the user privileges between development and production. Once in production the user should have priviledges as follows:
# REVOKE ALL ON bibsys_db.* FROM 'bibsys_db_user'@'localhost';
# GRANT SELECT, INSERT, DELETE, UPDATE ON bibsys_db.* TO 'bibsys_db_user'@'localhost';
# Also remember to change the DDL execution in the application.properties file to none.



# Main database schema name
CREATE DATABASE bibsys_db;


# Database user creation
CREATE USER 'bibsys_db_user'@'localhost' IDENTIFIED BY 'enter112';
GRANT ALL ON bibsys_db.* TO 'bibsys_db_user'@'localhost';
# If you want to change the password
ALTER USER 'bibsys_db_user'@'localhost' IDENTIFIED BY 'enter113';



# Main DDL and minimal data entry
SET FOREIGN_KEY_CHECKS=0;

# -> Include drop and create table queries here

SET FOREIGN_KEY_CHECKS=1;

