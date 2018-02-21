# Serverless Data Analysis using GCP

## BigQuery

Overview of BigQuery

Overview of a Bigquery Architecture
* Pub/Sub Autoscaling Message Queue (Real-time flow)
* Batch load (Server logs)

Dataflow > BigQuery

Use Datalab to do analysis, or BI Tools or Google Sheets

A project contains datasets
* Contains tables and views

Job is a long running action

Complex Queries and Functions
* Can query from multiple tables (using WHERE)

Load and Export Data:
* Logs
* Analytics
* Monitoring
* Pub/Sub
* Appengine

bq is a tool used to interact with BigQuery on the command line.

bq load can be used to load multiple files according to a schema into BigQuery.  

### Advanced Capabilities

* WITH washingtonstations AS ()
* ARRAY_AGG - aggregate the array elements (possibly from a struct) into a single row
* STRUCT - 

### Standard SQL Window Functions

Navigation functions:
* LEAD
* LAG
* NTH_VALUE

Ranking and numbering:
* CUME_DIST
* DENSE_RANK
* ROW_NUMBER
* RANK
* PERCENT_RANK

When you use a window function, you must provide a PAGINATE BY clause to window over.

### Date and Time

* Various DATE(y, m, d), DATE(t) and DATETIME
* CREATE TEMPORARY FUNCTION for calling also

UDF's - Javascript
* Can only return < 5MB

UNNEST - unpacks a struct

REGEXP_EXTRACT

### Performance/Optimisation

* I/O - 
* Shuffling - passing it to the next stage of processing

Keeping something in-memory is obviously much faster

Wildcard Tables - number of tables you are matching affects performance

Stages:
* Wait > Read > Compute > Write

## Dataflow

Based on Apache Beam

Each step is a transform

Each transforms inout is a parallel collection (PCollection)

PCollection<String>

```
Pipeline p = Pipeline.create(PipelineOptionsFactory.fromArgs(args);
p.apply(TextIO.Read.From("gs://bucket/thing.csv"));
p.apply(new CountWords());
p.apply(TextIO.Write.To("gs://bucket/output.csv));
```

in python this uses pipes as follows:

```
(p 
 | beam.io.ReadFromText("gs://bucket/thing.csv"
 | etc...
)
```

Names in a pipeline need to be unique.  

As well as p.apply(TextIO.Read.From("gs://bucket/thing.csv")), you can read from a topic with:

```
p.apply(PubSubIO.Read.From("topic"))
```

Can also write withoutSharding()

