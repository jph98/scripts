MySQL Snippets 
==============

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

Database Administration
-----------------------

Show database status:
    
    show status;
    
Show table statistics:

Querying
--------

Long column oriented queries - suffix with \G

