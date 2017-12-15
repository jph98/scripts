# Postgres Overview

Create and Drop database:

    drop database Template1;
    create database template1 with owner=postgres encoding='UTF-8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;
    update pg_database set datistemplate=true where datname='template1';
    
Allow user to createdb role:

    ALTER USER jon CREATEDB;

Switch to new database

    \c dbname
    
List schemas, functions, tables, views, users:

  \dn
  \dt
  \dt
  \dv
  \du
  
Describe a table

    \d tablename

Execute previous command:

    \g
    
Execute from a file

    \i filename.sql

Open vi to edit a command or an existing function:

    \e
    \ef
    
Quit

    \q

## Performance

Turn on query execution timing:

    \timing
    

