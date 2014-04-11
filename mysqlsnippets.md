MySQL Snippets 
--------------

Books
-----

* SQL Antipatterns - http://pragprog.com/book/bksqla/sql-antipatterns
* High Performance MySQL - http://shop.oreilly.com/product/0636920022343.do

Database Creation
-----------------

Creating a database

    CREATE DATABASE db;
    CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass';
    GRANT ALL PRIVILEGES ON db.* TO user@localhost IDENTIFIED BY 'pass' WITH GRANT OPTION;
    FLUSH PRIVILEGES;

Showing the create table statements:

    show create table paypal_ipn_log;

Drop a column

    ALTER table DROP column 'blah';

Adding a foreign key:

    -- Add a foreign key to the paypal_ipn_log table to link to config_set_to_installed_integration
    ALTER TABLE table_name 
	    ADD COLUMN new_col_id int unsigned default null,
	    ADD CONSTRAINT fk_new_col_id FOREIGN KEY (other_col) REFERENCES other_table (other_col);

Database Administration
-----------------------

Show database status:
    
    show status;
    
Show table statistics:

Querying
--------

Long column oriented queries - suffix with \G

