Template1 - update template for all created...

  update pg_database set datistemplate=false where datname='template1';
  drop database Template1;
  create database template1 with owner=postgres encoding='UTF-8' lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;
  update pg_database set datistemplate=true where datname='template1';

Create a database:

    CREATE DATABASE jon WITH OWNER = jon ENCODING = 'UTF8';
    
Allow user to createdb role:

    ALTER USER jon CREATEDB;
