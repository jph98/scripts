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

For regression...
* Take the list of outcomes and the errors
* Square all of them individually
* Calculate the mean!
* this is our mean squared error
* https://en.wikipedia.org/wiki/Mean_squared_error

* For classification:
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

Precision and recall:
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

