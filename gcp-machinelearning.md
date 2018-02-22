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

