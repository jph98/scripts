MySQL Snippets 
--------------

Books
-----

* SQL Antipatterns - http://pragprog.com/book/bksqla/sql-antipatterns
* High Performance MySQL - http://shop.oreilly.com/product/0636920022343.do

Database Creation
-----------------

Creating a database

```
    CREATE DATABASE db;
    CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass';
    GRANT ALL PRIVILEGES ON db.* TO user@localhost IDENTIFIED BY 'pass' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
```

Showing the create table statements:

```
    show create table paypal_ipn_log;
```

Drop a column

```
    ALTER table DROP column 'blah';
```

Adding a foreign key:

```
    ALTER TABLE table_name 
	    ADD COLUMN new_col_id int unsigned default null AFTER other_column,
	    ADD CONSTRAINT fk_new_col_id FOREIGN KEY (other_col) REFERENCES other_table (other_col);
```

Dropping a foreign key and column:

```ALTER TABLE table_name DROP foreign key fk_new_col_id, DROP new_col_id;```
    
## DB Administration

Show database status:

```show status;```
    
Show table statistics:

In a shell you can also display what the error codes are returned by MySQL with:

```perror 150```

Dump a database with:

```mysqldump dbname > dbname.sql```
	
Structure Only:

```mysqldump -d dbname > dbname.sql```

Include CREATE DATABASE:

```mysqldump -B -d dbname > dbname.sql```
	
Import the database from file with:

```mysql -u root < dbname.sql```
	
or if you already have the database and want to include the tables, use:

```mysql -u root _monitoring < dbname.sql```

Slow query log (slowest 5 top queries):

```mysqldumpslow -a -s r -t 5 /var/log/mysql_slow-log```

## Querying

Long column oriented queries - suffix with \G

## Select MySQL Performance Statistics

```
SELECT @@innodb_buffer_pool_size;
```
