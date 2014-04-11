Books
-----

* SQL Antipatterns - http://pragprog.com/book/bksqla/sql-antipatterns
* High Performance MySQL - http://shop.oreilly.com/product/0636920022343.do

Create database

    CREATE DATABASE db;
    CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass';
    GRANT ALL PRIVILEGES ON db.* TO user@localhost IDENTIFIED BY 'pass' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
