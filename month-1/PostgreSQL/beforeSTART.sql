/*


schema : is like a folder in your computer, it is a way to organize your database objects (tables, views, functions, etc.) into logical groups. Each schema belongs to a single database and can contain multiple objects. Schemas help to avoid name conflicts and provide a way to manage access control.

how to run scripts:
psql -U postgres -d your_database_name -f beforeSTART.sql

how to run scripts in psql:
psql -U postgres -d your_database_name 
\l : list databases
\c your_database_name : connect to your database
\i beforeSTART.sql : run the script
\dt : list tables
\dt schema_name.* : list tables in a specific schema
\dn : list schemas
\dn schema_name.* : list schemas in a specific schema
\q : quit psql



*/

/* 
    Create a database named "shop" if it does not already exist.
    This database will be used to store all the tables related to the shop.
*/
--create database shop;

/* 
    Create a schema named "shop" if it does not already exist.
    This schema will be used to organize the tables related to the shop.
*/
--CREATE SCHEMA IF NOT EXISTS shop;