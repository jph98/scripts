# GCP Data Engineering Training

Launching datalab - https://codelabs.developers.google.com/codelabs/cpb100-datalab/index.html#0

```
datalab create mydatalabvm --zone europe-west4-d
```

n.b. This creates:
* VM
* Persistent Disk
* Network and all relevant sub-nets
* Firewall rule to allow ssh

n.b. Shift Enter runs a block

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

## Tensorflow

* C++ engine fundamentally with a Python scripting engine.
* x and y co-ordinates - predict colour of dot
* Prediction - sum of x and y, < 0 (orange) > 0 (blue)
* Data, Features, Hidden Layers and Output
* Distance square root of x squared and y squared
* Insight (distance) - put into network - train with weights

Options:
* Feature Engineering
* Neural Network

Iterations, Learning Rate, Activation, Regularization, Reg Rate

10 weights, 5 weights - tweak and find weights to capture the data

Go with the simplest possible network that gives you best performance

### Training a neural network model

1. Collect predictors and target data - Rain and max temp (input our x,y)
2. Create model
3. Train the model based on input data (Adjusted the weight
4. Use the model to do the predictions

Neural Network - everytihng must be numeric for this

day of the week - categorical variable
* Use On Hot Encoding to convert them to 0/1 representation
* https://hackernoon.com/what-is-one-hot-encoding-why-and-when-do-you-have-to-use-it-e3c6186d008f

Do we have at least five examples of a particular value?
* Days in which temperature is 38 degrees (for example)
* Training set is two years of data
* n.b. Need to throw away day number as it's too specific

npredictors > nhidden > [activation function = relu] noutputs 

1. Collect predictors and target data (throw away other info, cat var)

* rain and max temp
* predict demand

```
predictors = data.iloc[:,2:5]
for day in xrange(1,8):
  matching = data['dayofweek'] == day
  predictors.loc[matching, 'day_' + str(day)] = 1
  predictors.loc[~matching, 'day_' + str(day)] = 0
```

2. Create the neural network model.  
* Regression (predicting number)
* Classification (predicting a category)

```
estimator = tf.contrib.learn.DNNRegressor(ihdden_units=[5], feature_columns=[...]);
```

3. Train...

How many layers

* adjust weight - rain and temp - get close to the no. of observed rides on the day

```
estimator.fit(predictors, targets, steps=1000)
```

4. Use... (just use original inputs)
* Create dict of all the variables
* Read the trained model in
* call estimator.predict

### Lab - Machine Learning with Tensorflow

* Use Tensorflow to create a neural network model
* Forecast taxi cab demand in New York
* Train 75%, validate with 25%

Full spectrum of machine learning:
* Tensorflow - if you want to extend the open source SDK  (ML Researcher)
* CloudMLE - Build machine learning models on your dataset (Build custom models as a data scientist)
* ML API's (Vision, Speech, Translate etc...) - Use Prebuilt Models (App Developer)

Size of dataset - accuracy goes up, huge compute problem
* Make use of Google ones (cause they're big, well trained and available to use)

### Machine Learning API's Lab

https://console.cloud.google.com/apis/

Create an API key, restricting if you need to

Install google-api-python-client and reset session

```
import base64
IMAGE="gs://cpb100data/llanfair.jpg"
vservice = build('vision', 'v1', developerKey=APIKEY)
request = vservice.images().annotate(body={
        'requests': [{
                'image': {
                    'source': {
                        'gcs_image_uri': IMAGE
                    }
                },
                'features': [{
                    'type': 'TEXT_DETECTION',
                    'maxResults': 3,
                }]
            }],
        })
responses = request.execute(num_retries=3)
```

## Data Processing Architectures - Ingest, Transform and Load

* Async Processing - great way to absorb shock and change
* Great for highly available systems
* Balance load across multiple workers
* Reduce coupling
* Accept requests closer to the edge

### Cloud Pub Sub

* Reliable, realtime messaging

### Serverless Data Pipelines

* Dataflow - allows you to execute Apache Beam pipelines

https://beam.apache.org/get-started/wordcount-example/

* Essentially a set of filters
* ParDo - parallel do (across multiple machines) - managed by Dataflow
* Each block is a Java Class or a Python class
* Can be executed on Flink, Spark, not just GCP
* Real-time and batch

Same code 
* Read from text, read from pub/sub

This will read from a topic, apply a sliding window function and output to a topic
```
Pipeline p Pipeline.create()
p.begin()
.apply(PubSubIO.Read.from("inputtopic")
.apply(SlidingWindow.of(60, MINUTES))
.apply(PubSubIO.Write.to("outputtopic"));
p.run();
```

Dataflow does the ingest, transform and load.

Task Scheduling - https://cloud.google.com/solutions/reliable-task-scheduling-compute-engine

Utilising Kubernetes for Real Time Data Analysis

* https://cloud.google.com/solutions/real-time/kubernetes-pubsub-bigquery

