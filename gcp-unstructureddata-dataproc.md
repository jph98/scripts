## Why Unstructured Data?

Types of data:
1. Analyze today
2. Collect but don't analyze (logs etc...)
3. Could collect
4. Partners/Third Parties (Stocks, weathers) - to correlate

Big Data focuses on (2) - approx 90% of data in an org.

Bank Videos - 4 x 4 grid, high traffic and low traffic areas

Google - trees, lawns etc...

Counting problems also:
* Human - real-time insight
* Counting Problmes - error rates decrease after bug fix, whhichh hstores are experience delays
* Counting + Insight - programmers checking in low quality code

21 - 30, nappies, also beer in the cart
* Move beer close the nappies
* Coupons, bundling, product placement - from items on a receipt

* ML API
* Cloud ML Engine

V's:
* Volume - amount
* Veracity - accuracy of data
* Velocity - speed

Even Google Skipped Unstructured Data

MapReduce - counting problems essentially

## Cloud Dataproc

Why use Dataproc?
* Dynamic provisioning and scaling of a cluster

bdutil - https://github.com/GoogleCloudPlatform/bdutil
* Automates some, but not as much as GCP

## Creating a Cluster

* Good naming convention is recommended
* Select a zone that is closest to your data

* Single Node - for everything (small datasets)
* Standard - 1 master + n worker nodes
* HA - three masters

Replication - 3x by default, bear in mind with disk size

Change Hadoop to use cloud storage for storing job data.

Pre-emptible worker nodes:
* Discounted Nodes
* Applies to Hadoop, Compute Engine etc...
* 40% less
* Unallocated 
* 30 seconds to finish off before shutdown!
* Fine for dataproc, not for a webserver!
* Dataproc manages joins/leaves

Check the Cloud Dataproc versions, different software on each

Initialization action for running custom scripts

```
gcloud dataproc clusters create --help
```

Firewall rule required to access browser interfaces

### Custom Machine Types

Dataproc cluster consists of:
* Dataproc cluster
* Dataproc agent
* Master Node
* Persistent Workers
* PVM Workers(s) - Compute Engine
* HDFS Persistent Disk

To create a custom machine with 6 CPU's and 22.5GB of RAM we use:

```
gcloud dataproc clusters create
...
--worker-machine-type custom-6-23040
```

n.b. You are charged for egress.

Can show command line or REST API.

### Running Jobs

Pre-emptible nodes - don't have HDFS.

Run a simple Spark job:

```
data = [0, 1, 2, 3, 4, 5]  # range(6)
distData = sc.parallelize(data)
squares = distData.map(lambda x : x*x)
res = squares.reduce(lambda a, b : a + b)
print res
```

Run a Pig job:

* Copy the files into HDFS
* Run the Pig job

Splitting storage and compute:

Separation of Storage/Compute
* YARN - cluster management
* Compute and Storage are coupled

GPC provides Google Cloud Storage (Colossus)

Pub/Sub > Dataflow > BigQuery

Benefits of serverless data processing:
* Speed to insights
* Low Cost
* Freedom to explore

Google have their own routers:
* With only specific software installed
* They omit the rest

## Submitting Jobs

https://www.coursera.org/learn/leveraging-unstructured-data-dataproc-gcp/lecture/jaUDf/submitting-jobs-with-dataproc-and-cloud-shell
