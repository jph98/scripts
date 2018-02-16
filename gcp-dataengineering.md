# GCP Data Engineering Training

## Module 1. Google Cloud Platform

* On Premise, Datacenter, Cloud
* Google buys 1 in 5 CPU's
* Edge Locations in 30+ countries
* Software Defined Networking
* Innovation in data technology

2006 - no longer creating map reduce programs
* Great for large datasets
* Need to shard the dataset across compute nodes (compute and storage tied together)
* Limited by number of compute nodes you have!
* INSTEAD, Google does Dremel and Flume instead - BigQuery and DataFlow

* Datastore, CloudSQL, BigTable, BigQuery
* Pub Sub, Dataproc, Dataflow

Code Lab Site - https://codelabs.developers.google.com/cpb100

## Module 2. GCP Compute and Storage

You can connect to an instance using gcloud with:

```
gcloud compute ssh googletron5000
```

Change project:
```
gcloud config set project
```

Checked authed accounts:

```
gcloud auth list
```

Copying files - gsutil cp
Creating buckets - gsutil mb

Google Cloud Service (GCS) handles edge services - replication, edge-caching, reliability
* Use multiple zones in a region for redundancy
* Use multiple regions for global domination!

n.b. Cloud Shell is ephemeral and gets terminated every 60 minutes.

## Module 3. Managed Services

ML Model:
* Get a person to rate rental houses
* Explicit rating - visited house and gave it 2/5.  Implicit - clicked on a link, or how long they looked at a house for.
* 10000 house catalog
* User may have rated 5 of these.
* 1m users, 100000 objects
* 1m rows, 100k columns
* Sparse Matrix
* Model needs to predict what a user would rate a house that they haven't visited yet
* Cluster users, cluster items
* Similar people liked, predicted rating = user preference * itemquality
* How often do you compute - hours to compute this, how often do you recompute
* Where would you save them

Pyspark on DataProc to do this.

Example used Alternating Least Squares Method/collaborative filtering, more info here:
* http://bugra.github.io/work/notes/2014-04-19/alternating-least-squares-method-for-collaborative-filtering/

### CloudSQL Instance

Google Cloud Shell - 5GB home directory that persists across sessions

Create a CloudSQL Instance
* Specify networking and add the IP address for the gcloud shell
* To find your IP address

```
wget -qO - http://ipecho.net/plain; echo
```

If you need to reauth then use:

```
gcloud sql instances patch rentals --authorized-networks `wget -qO - http://ipecho.net/plain`/32
```

Import the relevant data into the new database.

Dataproc - straightforward to create a cluster, but you need to authorise networking between the DB and HDP cluster explicitly:

```
gcloud sql instances patch <dbname> --authorized-networks <hdp-cluster-ip-addresses>
```

### Cloud Datastore

https://cloud.google.com/datastore/docs/concepts/overview

* Store Objects Directly - it's a document store
* ORM Impedence
* Scales up to Terabytes - storing hashmap (key:id > object)
* Persistent Hashmap - annotation, hibernate like
* Get back an iterable when it comes to read/search
* Transactional

BigTable is for high-thoughput data:
* Can ONLY search on the key
* Important to model correctly
* HBase API
* Tables should be tall AND NARROW
* Column family based
* You can also query using GQL - https://cloud.google.com/bigquery/external-data-bigtable
* Good for sparse data
* No-ops - balanced, compacted

Datalab - interactive notebook
* Installed locally on your machine
* Can run a docker container on the cloud as well - but need to run a SSH tunnel then to access this
* Can also run as a docker container, but run through a proxy/gateway instead
* Based of Jupyter notebook, Markdown based
* Creating a datalab, n.b. you can also create one with GPU's

```
datalab create cpb100lab
```

or connect with:

```
datalab connect cpb100lab
```

Cloud Source Repositories provide Git repositories on GCP:
* https://cloud.google.com/source-repositories/

Can use datalab to connect with BigQuery (SQL Code named wxquery) + standard Python (new cell for wxquery)

* Cloud Shell - create new VM
* Web Preview - switch to port 8081

https://github.com/GoogleCloudPlatform/training-data-analyst/blob/master/CPB100/lab4a/demandforecast.ipynb

Create a BQ Query:

```
%bq query -n taxiquery
WITH trips AS (
  SELECT EXTRACT (DAYOFYEAR from pickup_datetime) AS daynumber 
  FROM `bigquery-public-data.new_york.tlc_yellow_trips_*`
  where _TABLE_SUFFIX = @YEAR
)
SELECT daynumber, COUNT(1) AS numtrips FROM trips
GROUP BY daynumber ORDER BY daynumber
```

and feed it some parameters:

```
query_parameters = [
  {
    'name': 'YEAR',
    'parameterType': {'type': 'STRING'},
    'parameterValue': {'value': 2015}
  }
]
trips = taxiquery.execute(query_params=query_parameters).result().to_dataframe()
trips[:5]
```
