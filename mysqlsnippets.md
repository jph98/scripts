Create database

    CREATE DATABASE db;
    CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass';
    GRANT ALL PRIVILEGES ON db.* TO user@localhost IDENTIFIED BY 'pass' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
