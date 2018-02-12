# Google Storage Technology Overview

Run-down of the options are as follows:
* Cloud SQL - MySQL and Postgres fundamentally
* Cloud Datastore - NoSQL solution for web/mobile.  Operations are based around a specific query API - GQL.  Optimised more for smaller datasets.
* BigQuery - OLAP style solution.  2 sec query min. Lacks cross row tx support.
* BigTable - OLTP solution, operations are RESTFul in nature (GET, PUT, SCAN|0
* Cloud Spanner - versioned key/value store.  Table state is stored in Colossus.

https://weidongzhou.wordpress.com/2017/06/10/google-cloud-sql-vs-cloud-datastore-vs-bigtable-vs-bigquery-vs-spanner/

## BigQuery

* Temporary tables are only available for 24 hours.
* Cached data queries are free!

Use the Query Validator 

Options:
* Legacy SQL - untick.  Always Standard SQL.
* Use Cached Results

## Process

Ingest - BigQuery Storage
Transform - Dataprep
Store - Cloud Storage
Analyze - BigQuery Analysis
Visualize - Google Data Studio or Tableau, Looker or Qlik

Explanation for query is useful to view stages of execution for the query

Data is replicated into three data-centres, encrypted at rest and in transit

Colossus (GFS) separates processing and storage completely
* Data is read in parallel from many disks

Dremel is the internal name for BigQuery at Google
* Dremel is the computation engine
* Parallel, distribtued and column oriented
* Latest engine is called Capacitor - https://cloud.google.com/blog/big-data/2016/04/inside-capacitor-bigquerys-next-generation-columnar-storage-format

Dataflow - transformed and cleaned, analysed with Bigquery

irs_ein_990 bigquery dataset

## Lab 1

Count, distinct and diff:

```
SELECT count(ein) as ein_count, 
count(distinct ein) as ein_distinct, 
count(ein) - count(distinct ein) as ein_diff 
FROM `data-to-insights.irs_990.irs_990_ein`;
```

EIN's that have occured more than once:

```
select ein, name, count(ein) as ec 
from `data-to-insights.irs_990.irs_990_ein` 
group by ein, name 
having ec > 1 
order by name;
```

* where
* group by
* having - this exists because the where clause cannot deal with aggregate functions 
* aggregate functions - count, avg, round etc...

Format -  ("%'d", 1000) returns 1,000

n.b. Aliases do not exist yet when filtering in where.  However, you can use them in the HAVING section.

n.b. Everytime you use an aggregate function, you need to specify all those in the group by that aren't part of that function.

```
select company, sum(revenue) as totrvenue from table, group by company
```
```


Data Types:
* Numeric, String, Bytes, Date and DateTime
* Array ['a','b'] - single type only
* Struct <apple string>

## Working with strings

* LIKE
* CONCAT
* FORMAT

CAST and PARSE_DATETIME

```
EXTRACT(YEAR FROM PARSE_DATE('%Y%m', CAST(tax_pd AS STRING)) AS tax_period)
```

Statistical, User Defined.

Comments can be specified using -- or /* */ for multi-line.

Job:
* A job's history is kept for six months.  
* Contains a number of tasks
* Have to opt in to run high compute queries
* Free to load, export, query metadata, use cached queries, queries with errors
* Every query is kept for 24 hours

* $5 per TB (first one free)
* 0.02 per GB

Price calculator - https://cloud.google.com/products/calculator

Can set custom quotas for your project past the standard set provided to protect all BigQuery tenants.

Apply cost optimising principles:
* Only include what you need
* Use cached reulsts - perm tables intead of views
* Views are saved queries

Limit the user of user defined functions

n.b. The cache is NOT used when you use non-deterministic queries (e.g. CURRENT_TIMESTAMP) or when the underlying table is updated.

Views - virtual tables
* Each time view is queried the underlying query is rerun
* No results are stored
* An authorised view allows you to only give a user access to partial data
* n.b. A materialised view DOES contain the results of the query

Lab 5
* Create a new dataset
* Run a query
* Save as table in the dataset

Lab 6
* Ingest data into Bigquery from a CSV directly
* Ingest from cloud storage
* Create an external table in BigQuery and use the underlying datasource

## Unions and Joins

JOIN - fields from different tables
UNION - add more fields

Joins - common key is critical 

UNION DISTINCT - only appends new information in the other table, will not repeat

```
SELECT a, b, c FROM `bigquery.public.thing UNION DISTINCT bigquery.public.other
```

Limit of 1000 tables.

n.b. You can filter tables using a _TABLE_SUFFIX to include lots of different tables.

```
select a, b, c FROM `bigquery.public.thing*` WHERE _TABLE_SUFFIX > '1950';
```

## References

* Standard SQL Guide - https://cloud.google.com/bigquery/docs/reference/standard-sql/
* Public Datasets - https://cloud.google.com/bigquery/public-data/irs-990
* Keyboard Shortcuts - https://cloud.google.com/bigquery/bigquery-web-ui#keyboardshortcuts
