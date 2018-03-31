Druid

* Column Store
* Shards are called segments, always shards by time
* Segments - compressed columns
* queryGranularity - ms
* Rollup - aggregation, perfect and best effort

## Concepts

### Aggregation

perfect
* preprocessing step - intervals and shardSpecs
* Hadoop ingestion task - http://druid.io/docs/0.12.0/ingestion/batch-ingestion.html

best effort
* no preprocessing step
* might be larger in size though
* stream ingestion always runs with this - http://druid.io/docs/0.12.0/ingestion/stream-ingestion.html

### Ingestion

real time and batch ingestion
* Exactly once semantics are not guaranteed with real-time
* common approach is to use real-time (recent insights) and batch (accurate copy)

### Querying

* Single table operations only, no joins

### Infrastructure

* Historical Nodes - download immutable segments locally, serve queries.  Shared nothing
* Broker Nodes - querying: gathering and merging results
* Coordinator Nodes - manage segments on historical nodes
* Realtime Processing - can be done using standalone realtime nodes or the indexing service.
* Zookeeper - used for intra-cluster communication
* Metadata Storage - MySQL/Postgres
* Deep Storage - perm backup of segments. S3.  Historical nodes download segments from here.

White Paper - http://static.druid.io/docs/druid.pdf

* Dimensions - attributes you can filter and split on
* measures - metrics  you can aggregate on

## Ingestion

### Loading Batch Data

1. Submit an indexing task
2. Monitor with Overlord Console - http://localhost:8090/console.html
3. Data loaded into historical nodes, progress here - http://localhost:8081/#/

### Loading Streaming Data

* Tranquility - high level data producer

```
bin/tranquility server -configFile /Users/jon/workspace-blis/infra/druid-0.12.0/conf-quickstart/tranquility/server.json
```

## Querying Data

* Use the Broker node for queries
* Aggregation, Metadata and Search Queries possible
* Use Timeseries and Top N instead of GroupBy
* Queries can be cancelled

http://druid.io/docs/0.12.0/tutorials/quickstart.html#query-data
http://druid.io/docs/0.12.0/querying/querying.html

Imply Analytics Platform (for Pivot) - https://imply.io/get-started
