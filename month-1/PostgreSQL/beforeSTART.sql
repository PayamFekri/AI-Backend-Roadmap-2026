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


null : unknown or missing value, it is a special marker used in SQL to indicate that a data value does not exist in the database. It is different from an empty string or a zero value, as those are considered valid values. Null can be used in any data type and can be assigned to any column in a table, unless the column is defined as NOT NULL.
"" or '' : empty string, it is a string with zero length, it is a valid value for a string data type and can be assigned to any column in a table that allows null values. An empty string is different from null, as it represents a known value (an empty string) rather than an unknown or missing value (null).
0 : zero value, it is a numeric value that represents the absence of any quantity or magnitude. It is a valid value for numeric data types and can be assigned to any column in a table that allows null values. Zero is different from null, as it represents a known value (zero) rather than an unknown or missing value (null).



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

/*
foreign key : is a field (or collection of fields) in one table that refers to the primary key in another table. 
The foreign key establishes a relationship between the two tables,
allowing you to enforce referential integrity and maintain consistency in your data.
In PostgreSQL, you can define a foreign key constraint when creating or altering a table, specifying the referenced table and column(s).
When a foreign key constraint is in place, the database will prevent actions that would violate the relationship, such as inserting a value in the foreign key column that does not exist in the referenced primary key column.

primary key : is a field (or collection of fields) in a table that uniquely identifies each row in that table.
A primary key constraint ensures that the values in the primary key column(s) are unique and not null,
providing a way to enforce entity integrity in the database.

Composite Primary Key: is a primary key that consists of two or more columns in a table.
A composite primary key is used when a single column is not sufficient to uniquely identify each row in the table. Instead, the combination of values in the specified columns must be unique for each row.
When defining a composite primary key, you can use the PRIMARY KEY constraint followed by a list of the columns that make up the key, enclosed in parentheses.



*/