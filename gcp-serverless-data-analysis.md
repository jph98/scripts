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

A pipeline can be executed locally or on GCP.

Pardo acts on one item at a time, should be stateless
* Useful for filtering, converting, extracting, calculating

### Map

1:1 relationship, use map:

```
beam.Map(lambda word: (word, len(word));
```

Non 1:1 relationship, define a function with a yield statement and call from FlatMap.

IN JAVA however, you just use ParDo and pass a ParFn with @ProcessElement.

GroupBy is akin to shuffle.

See: 
* https://cloud.google.com/dataflow/examples/wordcount-example

1. Emit as KV pairs (Map)
2. Group by city: list of zip codes (GroupByKey)

### Combine

Combine allows you to aggregate, consider sales by person:
* Combine.globally will give you a specific value across a set of values
* Combine perKey allows you to get a total for each given key

Prefer Combine instead of GroupByKey (Dataflow knows about this and what to do)

Following example calculates the most popular packages in a set of Java classes:
* Reads from a input file
* Filters based on a keyword
* Return key value pair of package, 1
* Sum the integers per key
* Calculate top 5 packages
* Return a formatted string
* Write out to non sharded file

```
 .apply("GetJava", TextIO.read().from(input)) //
 .apply("GetImports", ParDo.of(new DoFn<String, String>() {
         @ProcessElement
         public void processElement(ProcessContext c) throws Exception {
                 String line = c.element();
                 if (line.startsWith(keyword)) {
                         c.output(line);
                 }
         }
 })) //
 .apply("PackageUse", ParDo.of(new DoFn<String, KV<String,Integer>>() {
         @ProcessElement
         public void processElement(ProcessContext c) throws Exception {
                 List<String> packages = getPackages(c.element(), keyword);
                 for (String p : packages) {
                         c.output(KV.of(p, 1));
                 }
         }
 })) //
 .apply(Sum.integersPerKey())
 .apply("Top_5", Top.of(5, new KV.OrderByValue<>())) //
 .apply("ToString", ParDo.of(new DoFn<List<KV<String, Integer>>, String>() {          
       @ProcessElement
       public void processElement(ProcessContext c) throws Exception {
               StringBuffer sb = new StringBuffer();
               for (KV<String, Integer> kv : c.element()) {
                       sb.append(kv.getKey() + "," + kv.getValue() + '\n');
               }
               c.output(sb.toString());
       }
})) //
.apply(TextIO.write().to(outputPrefix).withSuffix(".csv").withoutSharding());
```
                                
### Side Inputs

* So far, just one pcollection
* May need external piece of data into a transform

In-memory object can be provided as a contructor parameter

Sometimes you need to read from two sources:
* Process elements of one source
* You need the entirity of the data from the other source (a smaller one)
* Take source and convert it into a view (List or Map)

Pass side inputs and then call .of()
```
PCollectionView<Map<String, Integer> myMap = cz.apply()
Pardo.withSideInputs(myMap).of(new DoFn< KV<String, Integer>, KV<String, Double> >());
```

then within the context you can access the object by calling context.sideInput(myMap)

### Side Input Example With BigQuery

Find all popular packages on Github.  Find all FIXME's and TODO's

```
PCollection<String[]> javaContent = p.apply("GetJava", BigQueryIO.read().fromQuery(javaQuery)) //
```

### Streaming Pipelines

```
c.outputWithTimestamp(f, Instant.parse(fields[2]));
```

Aggregations must be done in windows:

```
.apply("window", 
 Window.into(SlidingWindows.
 of(Duration.standardMinutes(2)))
 every(Duration.standardSeconds(30));
```

Streaming example:
* Get messages from topic in window of 2 minutes sizes
* Output number of words in line
* Sum number of words in the window
* Convert this to a BigQuery row <Timestamp, Number of Words>
* Write apped, create if needed

```
TableSchema schema = new TableSchema().setFields(fields);
		p.apply("GetMessages", PubsubIO.readStrings().fromTopic(topic)) //
				.apply("window",
						Window.into(SlidingWindows//
								.of(Duration.standardMinutes(2))//
								.every(Duration.standardSeconds(30)))) //
				.apply("WordsPerLine", ParDo.of(new DoFn<String, Integer>() {
					@ProcessElement
					public void processElement(ProcessContext c) throws Exception {
						String line = c.element();
						c.output(line.split(" ").length);
					}
				}))//
				.apply("WordsInTimeWindow", Sum.integersGlobally().withoutDefaults()) //
				.apply("ToBQRow", ParDo.of(new DoFn<Integer, TableRow>() {
					@ProcessElement
					public void processElement(ProcessContext c) throws Exception {
						TableRow row = new TableRow();
						row.set("timestamp", Instant.now().toString());
						row.set("num_words", c.element());
						c.output(row);
					}
				})) //
				.apply(BigQueryIO.writeTableRows().to(output)//
						.withSchema(schema)//
						.withWriteDisposition(BigQueryIO.Write.WriteDisposition.WRITE_APPEND)
						.withCreateDisposition(BigQueryIO.Write.CreateDisposition.CREATE_IF_NEEDED));
```

Pipeline when run does not exit, it sits there as a consumer waiting on input.

n.b. You can drain a job when stopping it

n.b. You can handle stream and batch with GCP Dataflow.  Dataproc is only suitable for batch.
