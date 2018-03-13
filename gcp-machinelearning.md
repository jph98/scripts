# Serverless Machine Learning with Tensorflow

How to do machine learning on GCP using CloudML and Tensorflow

General purpose function - neural network
* Tune parameters of the function based on a known dataset
* Take tuned function - use to predict unknown values
* Large amount of data at scale

BI - way of working out what happened.

## Definition

Machine Learning is a way of deriving insight from data.

* label and input - "apple" and apple image
* ML model = mathematical function
* Function is trained (adjust trainable aparameters)
* Output

Give the tuned model a new image and resulting function will give you a prediction

* Label - correct output for an input
* Input - a given object, e.g. image
* Example - combination of <label, input>
* Model - function that takes an input and creates output that approximates the label for the input
* Training - process of adjusting properties of a model to make predictions
* Prediction - process of taking input, applying function to get the correct output

* Supervised Learning - learning by example
* Clustering - similar, but you don't have labels

Focus is on supervised learning for the course

* Regression - predict the tip amount (continuous number)
* Classification - predict gender of a customer

## Example regression model

Predict the gestation period 
* based on weights - age, cigarette use, alcohol use and weight gain
* Gestation weeks is a continuous number

We use structured data, may come from data warehouse
* JSON input

Presented to a machine learning model.
* Simplest model has one layer
* Layer of weights

gw = (w0 * a) + (w1 * cu) + (w2 * au) + (w3 * wg)+ b
* b is the bias
* weights are the

## Example classification model

Given email, detect whether this is spam or not
* label = spam, not spam
* output = 0 or 1
* probability for spam


## Unstructured Data?

How do we do this for an image?
* 3d array of numbers (r,g,b)

* 1d = vector
* 2d = matrix
* nd = tensor

so an image is a tensor

What about words?
* Map a word to be a vector
* Many, plenty should be similar though
* assign appropriate vector to word - machine learning problem
* word > vec

ax + by > c

How to find good values for a, b and c?
* Use Gradient Descent to find best parameters
* Starting Point > Change WEight, compute MSE
* Which direction does MSE go in?
* Iterate on this

1. Start a model with random weights
2. Calculate error on labelled dataset
3. Change the weight so error goes down
4. Repeat (2)

Batches tend to be few hundred normally, rather than the whole dataset.
* 100k samples
* batch of 100 samples
* change weights a 1000 times
* every 10 epochs (or every 30 mins)
* stop, calculate error on entire dataset

5. Is the model good enough?

## Neural Network Playgrounnd

Use Tensorflow playground:
* http://playground.tensorflow.org/

Spam or not spam
* Classify emails into spam and not spam
* x1 and x2 (weights)
* Ask gradient descent algorithm to find good weights
* assuming bias is 0, tweaking x1 and x2

* Weights - parameters to adjust
* Batch Size - number of points we try out changes in weights
* Epoch - one traversal through the whole dataset (1000 batches where batch size is 100 and total is 100k)
* Gradient descent - process to find good weights (lower error)
* Evaluation - step we carry out every once in a while - how well does model do over entire dataset
* Training - entire process (take data, divide into batches, carry out gradient descent, evaluate at epoch)

What about images
* Value of pixel becomes input
* output vector with probability (1.0)
* determine hand written number 
* softmax (for normalizing to 1.0)

Ca you use a single line to separate dots?  
* Can't draw one line
* Add more neurons
* There's an optimal number of neurons
* Each divides the input features in a different way

## Features

Can we separate a swirl?
* More HIDDEN LAYERS > more hierarchies
* Learns polygons

Can we do this without adding layers?
* Yes - add extra features
* Bring in human intuition
* X SQUARED and Y SQUARED to help the model learn faster

End up adding extra human layers and features!

Terms:
* Neurons - way of combining inputs (weighted sum of inputs). Activation functions.
* Hidden layer - combination of neurons that share inputs
* Inputs - feed into neuron, can also be features
* Features
* Feature Engineering 

## Effective Machine Learning

* Have to organise data (as well as collect data and develop model)
* Make sure data you collect covers all possible issues
* e.g. sky pictures to detect clouds

Negative examples and near misses:
* e.g. cartoon clouds, penguins, cotton balls, chem trails
* Need to make sure you have these!

Fix the problems with the data
* e.g. Temp change, one massive drop in one of the samples
* Need to be able to deal with this at prediction time
* More robust prediction algorithm
* Find out WHY this exists - go back, outlier might be something we can reason about

Error Metrics:
* Start with outcome of specific event (win $98, but you lost 
* Error = truth - prediction $103 off!

### Regression - Mean Squared Error

* Take the list of outcomes and the errors
* Square all of them individually
* Calculate the mean!
* this is our mean squared error
* https://en.wikipedia.org/wiki/Mean_squared_error

### Classification - Confusion Matrix

* We use Cross Entropy instead
* It is differentiable
* Between 0 and 1
* Y cap is the model estimate
* log loss
* Use it optimise the model
* Better way = Confusion Matrix!

Confusion Matrix:
* Take Truth
* Take what ML model gave us
* Specify the true positives
* Specify the false negatives
* Cat and NoCat images

Classification Accuracy:
* From the confusion matrix 
* Hypothetical cat images
* Accuracy is fraction correct
* 3/8 or 0.375
* Correct the image detections for cats

If dataset is not balanced, accuracy has a problem
* 1000 parking spaces, 990 taken, 10 available
* ML Model - identifies only 1 as available
* Accuracy of the model? - 991 / 1000 = 0.991 or 99.1%
* Not balanced!
* 990 of one class and 10 of another
* For unbalanced look at precision and recall

### Precision and recall

* Precision - positive prediction value
* Cats and Nocats
* 2/5, so 0.40  or 40%
* Apply to parking space problem
* 1 so 100%

Recall - true positive range:
* Find all cats - how many does ML find?
* 4 images of cats
* ML finds 2, so recall is 2/4 or 50%
* Parking...
* 10 empty space, we find one, 1/10 or 10%

So, bottom line:
* Class model
* Cross-entropy is the error we use to do optimisation
* Precision and recall are the measures of skills we use to describe dataset, the performance of model
* Precision and recall if unbalanced
* Accuracy - if balanced

### Model Threshold

Changing the model threshold:
* ML classifiers return a number between 0 and 1
* Classification problems
* Precision and recall don't tell you how GOOD the model is
* Class - number between 0 and 1
* By changing the threshold you can get whatever recall, precision you want
* e.g. set to 0, recall would 1, precision would be 0
* 75% - set threshold to be 0.75
* 0 means every parking spot is empty (for example). def find all parking spaces, recall is 1, false positive rate is ALSO going to be 1
* Curves will be worthless, good (around 0.75) or excellent

Terms:
* MSE - Mean Squared Error (Error used to optimise a regression problem)
* Cross-entropy - used to optimise classification problems 
* Accuracy - fraction correct
* Precision - measure of skill that looks at the accuracy of a category selection (very common) few cats
* Recall - accuracy for finding things given a cat (very rare) lots of cats
* ROC curve - false positive to false negative rate - used to pick the right threshold for a classification model

Lab - predicting taxi fares:
* Fare amount and distance travelled
* Fit line to the points
* RMSE - 22.24 in this case ($)
* Another model has an RMSE of 0
* Purpose on ML model is to predict
* Model 1 generalises well with new data, model 2 not so much

Split dataset
* Training Data 
* Validation Data - evaluate on this
* Look at error
* Model straight line - underfit
* Increase model complexity
* Increase model complexity - overfit
* Evaluate model on validation data
* Hyper-parameter tuning - layers, neurons increase

Evaluating the final model:
* Option 1. Cross validate - average of all of these tell you how good your model is.  Change splits
* Option 2. Use independent test data - wait for new data?

## Lab - Taxi Ride Regression Fare Prediction Problem

* Fair bit wrong with the data that needs cleaning (zero passengers in cars for example)
* Clean that up with Python, then prepare the datasets for training, validation and test
* Picked only 10k rows here

Key things done here:
1. Explored data
2. Figured out parameters to use.  Wrote out CSV of parameters
3. Built a benchmark

Know what the target is.  You have to have a benchmark/target in mind.

```
shuffled = tripsqc.sample(frac=1)
trainsize = int(len(shuffled['fare_amount']) * 0.70)
validsize = int(len(shuffled['fare_amount']) * 0.15)

df_train = shuffled.iloc[:trainsize, :]
df_valid = shuffled.iloc[trainsize:(trainsize+validsize), :]
df_test = shuffled.iloc[(trainsize+validsize):, :]
```

* Write these out to CSV's
* Firstly let's build a very very simple model

```
FEATURES = ['pickuplon','pickuplat','dropofflon','dropofflat','passengers']
```

```
TARGET = 'fare_amount'
columns = list([TARGET])
columns.extend(FEATURES) # in CSV, target is the first column, after the features
```

and compute the RMSE:

```
def compute_rmse(actual, predicted):
  return np.sqrt(np.mean((actual-predicted)**2))

def print_rmse(df, rate, name):
  print ("{1} RMSE = {0}".format(compute_rmse(df['fare_amount'], rate*estimate_distance(df)), name))
 ```
 
## Getting Started with Tensorflow

Getting started, loops, graphs and monitoring with TensorBoard.

* Tensorflow - numeric computation library.
* Runs on a variety of hardware platforms
* Training an ML model
* Running an ML model
* We write neural networks in Tensorflow
* You can run Tensorflow in a distributed mode, on many machines

What is a tensor?
* n dimensional matrices/vectors

NumPy - array(3,5,8) - holds three numbers
* Can add things in this

### Graphs

* We need to separate out building and running.
* A simple graph can be built and run as follows (bad way):
* MatMul can be carried out on one machine and results sent to another.
* Some parts of the graph could execute on a GPU, some on a CPU.
* New nondes can be added to the graph whilst it is executing.

```
a = tf.constant([5, 3, 8])
b = tf.constant([3, -1, 2])
c = tf.add(a, b)
with tf.Session() as sess:
  result = sess.run(c)
  print result
 ```
 
but you should use placeholders and put a dict in instead.

Find area of a graph using tf.

### Tensorflow Operations

https://www.tensorflow.org/api_docs/python/tf

## Use Tensorflow for Machine Learning (Worked Example)

Use the Estimator API.

Regression or classification problem?

* Label? - price
* Features? - square footage of the house

Square Footage > Model > Price
Train > Evaluate > Predict

"Here's the square footage, predict the price based on previous data"

* Use the LinearRegressor from the contrib model (as opposed to LinearClassifier.
* You must pass a function that is callable to Tensorflow, you cannot pass a parameter

```
#!/usr/bin/env python

import tensorflow as tf

# Our training function that takes features, labels and values
def train():
    fd = { "sq_footage": tf.constant([1000, 2000])}
    ld = tf.constant([100000, 200000])
    return fd, ld

def predict():
    return { "sq_footage": tf.constant([1500])}

# Regression Model
cols = [tf.contrib.layers.real_valued_column("sq_footage")]

# 1. Setup feature columns
estimator = tf.contrib.learn.LinearRegressor(feature_columns=cols)

# 2. Train
estimator.fit(input_fn=train, steps=100)

# 3. Predict (price of new house for 1500 square feet)
for i in list(estimator.predict(input_fn=predict)):
    print i
```

Creating a DNNRegressor:
* 1 input
* 3 hidden
* 1 output

How do we know how many to use?

```
tf.contrib.DNNRegressor(feature_columns=..., hidden_units=[128,64,32])
```

### Create a Machine Learning model with a DNNRegressor

* Simple linear regression based on previous example, we convert the Pandas dataframe into a tf dataframe.
* Columns in the CSV file are the features.
* Batch size is the same as epoch in the example
* Create a model
* Trained it
* Predict!

* Now, let's try with a deep neural network (since the prediction above was for $11 for every trip)

## Tensorflow on Big Data using Batches

Now we need to learn to do this on a bigger dataset
* The Pandas dataset was held in-memory
* Calculate RMSE

Let's deal with out of memory data, add features and look at the model architecture.

Look at tensorflow middle layer (useful components).

https://www.coursera.org/learn/serverless-machine-learning-gcp/lecture/G9gVu/gaining-more-flexibility-lab

Doing gradient descent.
* Going through data 50 times is same as going through the data once.
* Random shuffle on filename
* Create a filename queue (each file num epoch times)
* Could repeat ABC, ABC, but this is problematic.  Files are not the same size though.  One of the files might cause a slowdown.
* So Randomize!
* Readers will process these, decode them add add to an example queue
* Tensorflow will read from this queue

```
filename_queue = tf.train.string_input_producer(input_file_names, num_epochs=num_epochs, shuffle=True) 
```

Create the reader for this and get a line_number (or whatever it returns) and a value (array of lines):

```
reader = tf.TextFileReader()
_, value = reader.read_up_to(filename_queue, num_records=batch_size)
```

Convert to a tensor with dims:

```
tf.expand_dims(value, -1)
```

If we have missing numbers, we specify a default values array for each input:

```
columns = decode_csv(value_column, record_defaults=DEFAULTS)
```

What?

```
layers.real_valued_column('pickuplon')
```

1. So this ran the training for num_steps or num_epochs
2. Saved checkpoints during training (Kept fitting, kept saving)
3. Used the final checkpoint as the model

70th step might be the best model, we just picked the last one?!?!

## Use Tensorflow's Estimator Experiment for Distributed Training

Going forward we need to:

1. Handle failure of a machine
2. Choose model based on validation dataset
3. Monitor training, what epoch it is on
4. Resume training if we need to


* Instead of using the linear regressor directly, use the Experimenter class instead of hand-coding our ML pipeline.
* Estimator provides Experiment
* Evaluate: Could optimise on cross_entropy and validate on recall, potentially
* Use eval_metrics to pass the evaluation function (see below)
* Change to INFO instead of WARN (default)
* Monitor training - use Tennsorboard

```
import tensorflow.contrib.learn as tflearn
from tensorflow.contrib.learn.python.learn import learn_runner
import tensorflow.contrib.metrics as metrics

def experiment_fn(output_dir):
    return tflearn.Experiment(
        tflearn.LinearRegressor(feature_columns=feature_cols, model_dir=output_dir),
        train_input_fn=get_train(),
        eval_input_fn=get_valid(),
        eval_metrics={
            'rmse': tflearn.MetricSpec(
                metric_fn=metrics.streaming_root_mean_squared_error
            )
        }
    )
shutil.rmtree('taxi_trained', ignore_errors=True) # start fresh each time
learn_runner.run(experiment_fn, 'taxi_trained')
```

As you train:
* Model will not generalise over time
* Loss will keep going down.  Error (the loss) will increase however EVENTUALLY
* So we only want to train until the errort STOPS decreasing, early stopping.

In real world we need to train in distributed way
... and choose model that gives us best genneralisation process (on validation dataset).  Important!

## Scaling up machine learning with CloudMLE

We have a Tensorflow model, nonw lets run it at scale.
* Split into batches, run on different machines
* Inputs > Preprocessing > Feature Creation > Train Model > Model
* Might combine features, might square things etc...
* Might not be sure about model, how many layers etc... (Tune - Hyper-parameter tuning)
* Take model - put it behind a REST API - make available to webapp

Training - Serving Skew, how to we go this?
* CLoudML helps here
* Scales out training
* Apply same feature creation and training
* Apply hyper param tuning
* Maturing your model
* Use Apache Beam - cope with historical, but also with streaming data
* Input Data - Batch Pipeline
* Realtime - streaming data from the client

### Packaging up the model

* Package as a Python module

```
setup.py
\training
\training\task.py - the executable 
\training\model.py - ML model - estimator.Experiment etc...
__init__.py
```

export the PYTHON_PATH and execute.

Run locally:

```
gcloud ml-engine local train \
   --module-name=trainer.task \
   --package-path=${REPO}/courses/machine_learning/cloudmle/taxifare/trainer \
   -- \
   --train_data_paths=${REPO}/courses/machine_learning/datasets/taxi-train.csv \
   --eval_data_paths=${REPO}/courses/machine_learning/datasets/taxi-valid.csv  \
   --num_epochs=10 \
   --output_dir=${REPO}/courses/machine_learning/cloudmle/taxi_trained 
```

First copy the training data to the cloud.  Then, launch a training job.

Submit the job to CloudMLE:

```
gcloud ml-engine jobs submit training $JOBNAME \
   --region=$REGION \
   --module-name=trainer.task \
   --package-path=${REPO}/courses/machine_learning/cloudmle/taxifare/trainer \
   --job-dir=$OUTDIR \
   --staging-bucket=gs://$BUCKET \
   --scale-tier=BASIC \
   --runtime-version=1.0 \
   -- \
   --train_data_paths="gs://${BUCKET}/taxifare/smallinput/taxi-train*" \
   --eval_data_paths="gs://${BUCKET}/taxifare/smallinput/taxi-valid*"  \
   --output_dir=$OUTDIR \
   --num_epochs=100
```

This will run through a queue and set of states, until CloudML and Tensorflow has finished runninng it.

Next deploy the model:

## Feature Engineering

Next we will improve the ML model using feature engineering.

https://8081-dot-3463068-dot-devshell.appspot.com/notebooks/datalab/training-data-analyst/courses/machine_learning/feateng/feateng.ipynb

* Getting better than our heuristic model. Haven't got here yet!
* Better models, better performance.

### Good features

* Related to the objective (have a reasonable hypothesis), otherwise throw it away
* Known at production time
* Numeric, with good magnitude
* Enough examples
* Have human insights

Don't do data dredging! (Relationship of stalks to babies)

Objective > Feature

e.g. Predict credit card fraud:
* Whether cardholder has purchased here before (YES)
* Card reader speed (NO)
* Category of item (TV) - (YES)
* Expiry date of credit card - (NO)

### Known value at the time of predicting

* Make sure every input/feature will be there at prediction time!
* Collecting in timely manner
* Legal/ethical aspects of collecting the data
* 
