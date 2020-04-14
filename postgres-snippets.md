# Postgres Overview

## Working with Postgres and Docker

```
mkdir -p $HOME/docker/volumes/postgres
docker run --rm   --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data  postgres
docker exec -it pg-docker /bin/bash
```

Connect to database

    psql -h localhost -U postgres

## Managing User Accounts

Allow user to createdb role:

    ALTER USER jon CREATEDB;

## PSQL

Switch to new database

    \c dbname
   
Describe a table

    \d tablename
    
List schemas, functions, tables, views, users:

  \dn
  \dt
  \dt
  \dv
  \du
  
Execute previous command:

    \g
    
Execute from a file

    \i filename.sql

Open vi to edit a command or an existing function:

    \e
    \ef
    
Quit

    \q
    
## Database and Table Creation

Create new database:

    CREATE DATABASE pgtest;

Create new table

    CREATE TABLE useraccount(
        id serial PRIMARY KEY,
        name VARCHAR (50) UNIQUE NOT NULL,
        balance MONEY NOT NULL
    );
    
Insert into table:

    insert into useraccount (id, name, balance) VALUES(1, 'new balance', 43.01)

Set the search path to a specific schema for running a query

    SET search_path = open_banking, "$user", public; -- For current session only
    select count(*) from transactions;

Query table:

    select * from useraccount;
    select id, name, balance from useraccount;
    
n.b Postgres is fine if you keep everything in lowercase in terms of naming scheme.  However, if you've camelcased the names of the tables or columns you need to surround them with quotes.

Inner Join with Aliases

    select  t."id", 
            t."accountId",
            c."group",
            FROM "transactions" t
            INNER JOIN "categories" c
            ON c."id" = t."categoryId";
    
## Performance

Turn on query execution timing:

    \timing
    
Get number of sessions:

    select count(pid) from pg_stat_activity;
    
Get detailed session info:

```
select pid as process_id, 
       usename as username, 
       datname as database_name, 
       client_addr as client_address, 
       application_name,
       backend_start,
       state,
       state_change from pg_stat_activity;
```
