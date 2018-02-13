# Google Storage Technology Overview

Run-down of the options are as follows:
* Cloud SQL - MySQL and Postgres fundamentally
* Cloud Datastore - NoSQL solution for web/mobile.  Operations are based around a specific query API - GQL.  Optimised more for smaller datasets.
* BigQuery - OLAP style solution.  2 sec query min. Lacks cross row tx support.
* BigTable - OLTP solution, operations are RESTFul in nature (GET, PUT, SCAN)
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

Weather + Stations

* JOIN (INNER) - common
* LEFT (OUTER) - common plus weather
* RIGHT (OUTER) - commons plus stations
* OUTER - everything

There is also the CROSS JOIN:
* Cartesian Product of two tables
* Each row is multiplied

https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/

## Cleaning and Transforming Data

* Dataprep mainly
* 80% of analysts time is spent preparing data
* Ensure data is unique
* Ensure data is in the range of possible values

Data Cleaning - https://www.dataquest.io/blog/data-cleaning-with-python/

Need completeness - all possible cases required
* Lamps and Clocks - machine learning difference

Consistent data ensures harmony across systems:

Uniformity in data means measuring the same way

Understanding dataset shape (tall and wide, wide, but short, even, small)
* Number of rows
* Number of columns

Understanding dataset skew (distribution of values)
* e.g. More data in California than the rest of the states

Clean and Transform:
* Setup field data type constraints - unique etc... on insert
* Specify fields as nullable and required
* Propactively check for null values
* Explore dataset shape and skew and look for missing values - NULLIF, IFNULL, COALESCE
* Enrich the existing data by using UNION and JOIN

Document and comment your approach
* Format to clearly indicate units
* Cast data types to the same format

Careful with NULL and empty values

Chain rules together into a recipe

e.g. 
* Break rows using \n
* Split column into another 200
* Convert row 1 to hearder
* Change EIN to integer

## Explore With Tools - DataPrep

Create repeatable data transformation flows in a UI

Create Flow
* Add Dataset or Import Datasets
* Add New Recipe.  Then Edit Recipe and the transformer.
* Resulting dataset is displayed with columns and summaries for the data including missing or bad values.

You can do this over a sample of your data and get your transformations right.

After this, we can apply transformations to all our datasets.

Add Wranglers:
* Eliminate duplicates
* Split column out into multiple
* Add a header row

You can change the way it samples?

Remove duplicates is the default normal step, mostly.

Dataprep has 17 data types - https://cloud.google.com/dataprep/docs/html/Supported-Data-Types_57344778

Run Job - effectively creates a Google DataFlow from the recipe and runs it:
* you can view the dataflow, plus the dependencies as well
* Specify output file in Google Storage or Bigquery etc..

With BigQuery:
* Append or drop the table when data is inserted

Union the datasets

Specify a custom formula for a given column to split and format it appropropriately
* e.g. merge([left(tax_pd, 4),right(tax_pd, 2),'01'], '-')

## Stats Functions

* CORRELATE - Look at whether one variable is highly correlate to another (e.g. company revenue and company expenses)
* STDDEV - 

Approximation functions - lots of
* e.g. APPROX_COUNT_DISTINCT - 99.97% accurate vs COUNT_DISTINCT
* 7 seconds to 5 minutes on BigQuery
* Very good and very fast generally.  Approx is cheap!
* Another good example is when you need a rough number and there's lots of data (think counting log files at Google scale)

Analytic 'Window' Functions:
* These are not partitioning tables
* RANK() function for aggregating over groups of rows

```
SELECT firstname, department, startdate, RANK() OVER ( PARTITION BY department ORDER BY startdate) AS rank FROM Employees;
```

* Doesn't separate tables
* Can group by to separate into departments
* Example given of Shakespeare books (partition by) and find word_count for each corpus/book

User Defined Functions - avoid if you can:
* They are costly
* https://cloud.google.com/bigquery/docs/reference/standard-sql/user-defined-functions#supported-external-udf-languages

WITH clauses (CTE's) and Subqueries:
* CTE - Common Table Expression - WITH is simply a named query
* Subqueries are not materialised
* Act as temporary tables
* Breaks up complex queries
* Can reference subqueries in other subqueries

Example:

```
WITH summary AS (
SELECT
  CONCAT("20",_TABLE_SUFFIX) AS year_filed,
  COUNT(ein) AS nonprofit_count,
  AVG(totrevenue) AS avg_revenue,
  AVG(totfuncexpns) AS avg_expenses
FROM `bigquery-public-data.irs_990.irs_990_20*`
WHERE _TABLE_SUFFIX >= '13'
GROUP BY year_filed
ORDER BY year_filed DESC
)

SELECT
  year_filed,
  nonprofit_count,
  avg_revenue,
  avg_expenses,
  avg_revenue - avg_expenses AS avg_income
FROM summary
ORDER BY avg_income DESC
```

## Complex SQL And Data Architecture

* Break out things into lookup tables if needed
* Problem with normalisation is cost - you have to join, which is more expensive
* If you can avoid JOIN's then do it

## Schema Design and Nested Data Structures

In relational database if you need to access one column in a row you have to read the whole row

* Bigquery is column oriented, not record oriented, built for speed
* Bigquery breaks apart table into pieces - onto GFS2
* Nested Fields

Bigquery minions communicate by shuffling data in-memory
1. Workers consume data values and perform ops in parallel
2. Workers produce output to in-mem shuffle service
3. Workers consume new data

2000 minions available for a query approx

Normalised vs Denormalised vs Repeated
* Three tables related in music, artist info, dif albums per artist, songs per album per artist (normalised)
* Join all the tables and create a new table from it - actually 40% bigger! (denormalised)

With repeated fields we can nest them inside a data structure to prevent repeated data:

Always create an alias for a struct.

You can't query for something inside a struct by default, it requires something special:

```
SELECT
  ein,
  expense
FROM `data-to-insights.irs_990.irs_990_repeated` n, n.expense_struct AS expense
WHERE expense.type = 'Legal'
ORDER BY expense.amount DESC
LIMIT 10
```

n.b. The , here indicates a CROSS JOIN and an UNNEST (CROSS JOIN UNNEST(n.expense_struct) AS expense.

## Optimising for Performance

* I/O - how many bytes
* Shuffle - how many bytes did you pass?
* Materialisation - how many did you write to storage
* CPU Work - UDF's, functions

* Avoid SELECT *
* Always filter as early as possible
* Do not use ORDER BY without LIMIT
* Be aware of data skew

Diagnose with the Query Explanation Map

Partitioning:
* Partition a single table based on specified day or date column

Use Stackdriver to monitor performance of Bigquery.

* Only query the columns need
* Check skewed data
* No ORDER BY without LIMIT
* GROUP BY on hgih cardinality field

## References

* Standard SQL Guide - https://cloud.google.com/bigquery/docs/reference/standard-sql/
* Public Datasets - https://cloud.google.com/bigquery/public-data/irs-990
* Keyboard Shortcuts - https://cloud.google.com/bigquery/bigquery-web-ui#keyboardshortcuts
