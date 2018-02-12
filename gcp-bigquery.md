## Bigquery Overview

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
