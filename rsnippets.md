###Packages

Show all packages:

    search()

Display the package search pths

    searchpaths()

Display all objects in a package:

    objects("package:datasets")
    
Display all functions matching a name

    apropos("^is.")

#####Installing an R package

    R CMD INSTALL mangoTraining_1.0-6.tar.gz
    
or:

    install.packages("mangoTraining")

from a different repository:

    install.packages("mangoTraining",repos="http://rpackages.mango.local")

This will be installed into a temporary directory for packages.  To display the directory use:

    .libPaths()
    
    ls /Library/Frameworks/R.framework/Versions/3.0/Resources/library

Packages can have objects that are MASKED.  This means you're overriding thean object in base.  

    as.Date()

You can call the masked function with:

    base:::as.Date()
    
You can display help for a function with:

    help("mean")
    ?mean
    help.start()

###Working with scripts

Open the script in RStudio with New -> Script, to run the current line use:

    MACKEY + ENTER

#####Directory Working

Get the current working directory

    getwd()
    
Set the working directory

    setwd("/Users/Jon/workspace")

###Capabilities

    capabilities()
    
###Reading Arguments

    args <- commandArgs(trailingOnly = TRUE)
    collectdir <- args[1]
    resultsfile <- args[2]

###Variables and Types

#####Getting the type of a variable

    x <- "blah"
    typeof(x)
    mode(x)

#####Variable Types

Character
    
    "hello"
    
Numeric

    2
    
Complex:
    1 + 2i
    
Logical (true/false)

    TRUE
    FALSE
    3 > 5
    3 == 5
    3 != 5

Missing Value, always use NA

    NA
    
#####Vectors - c function, 

    vec <- c(1,2,3)
    
You can also create a vector with named values:

    vec <- c("a" = 2, "b" = 4)
    str(c(1,2,3))
    
Can query a vector by length, names and mode

    length(vec)
    names(vec)
    mode(vec)
    
Can also retrieve specific elements form a vector

    vec[2]
    
and sequences:

    vec[ c(1,2) ]
    vec[ 1:2 ]

All elements EXCEPT specific ones:

    vec[ - 2]
    
And also query the vector based on logical statements:

    vec > 3

gives:

    a     b
    FALSE TRUE

Get a subset of the result of a logical statement

    vec [ vec > 3 ]

This is like List Comprehensions in Python

    year < - rep(c(1963, 1964), c(3,3))

gives us:

    1963 1963 1963 1964 1964, 1964

append an element to a vector with:

    year <- c(year, 1964)

Operations on these structures:

    year < - rep(c(1963, 1964), c(3,3))
    month <- rep(1:3, 2)
    amount <- c(1.1, 1.2, 1.9, 1.6, 1.6, 1.7)
    
applied like this:

    month [ year == 1963 ]
    month [ amount > 1.5 & year == 1963 ]
    
#####Matrices - cbind

Create a simple matrix with column bind:

    cbind(1:3, c(6,3,4))
    
and row bind:

    rbind(1:3,4:6,7:9)

Creating specific vectors (page 3-12):

    cbind(-1:1, 1, -1:1)
    cbind(LETTERS[1:6], rep(letters[1:3], 2))
    matrix(rep(1:3, 4), ncol = 3)
    matrix(rep(LETTERS[1:3], 4), nrow = 3, byrow=T)
    
Request the dimension of the matrix:

    matr <- cbind(1:3, 1:3)
    dim(matr)

will give us a 3x2 mtrix

Apply names to the matrix with dimnames

Can slice and dice matrices using various tricks

By row

    matr[1,]
    
By column

    matr[,1]

This drops the matrix format though and return a vector.

You can specify to NOT drop the matrix format with the following:

    matr[,1, drop = F]
    
#####Arrays

    myarr < - array(1:18, c(3,3,2))

gives us:

    , , 1

    [,1] [,2] [,3]
    [1,]    1    4    7
    [2,]    2    5    8
    [3,]    3    6    9
    
    , , 2
    
         [,1] [,2] [,3]
    [1,]   10   13   16
    [2,]   11   14   17
    [3,]   12   15   18

Query this by row then column then depth:

    myarr[1, 2, 1]
    
#####Lists

Lists are containers for other objects.  We can store a vector, matrix in a list for example:

    mylist < - list(vec = myVec, mat = myMat)

#####Dataframes

A dataframe is a list of same sized vectors where each element has a name.

    data.frame(time = cdata[,c(2)], mempagein = cdata[,c(41)] / 1000)
    mydf <- data.frame(X=1:10, Y=letters[1:10])

Dataset provided by the datasets package:

    iris
    head(iris)
    tail(iris, n = 10)
    
Extract an attribute with:

    iris$petals

######Factors

Categorical variables:

    x <- letters[1:4]
    factor(x)
    
This is an efficient way of storing strings.  This is very much like Ruby Symbols.

Look at the factors help file.

Useful with graphs when you want to play about with the order of variables.

#####Sequences

    seq(from = 1, to = 4)
    
#####Repeat a character ten times

    rep(1, 10)
    rep(c(1,2,3), 10)
    
You can mix this up, but the types get coerced 

    LOGICAL > NUMERIC > CHARACTER
    
Truthiness!

#####Converting Variables

    as.numeric(x)
    
    mylog <- c(T,F,T,T)
    as.numeric(mylog)
    
###Text Handling

#####Printing Text

    print("blah)

#####Concatenating Text

    print(paste("Wrote ", name))

###Functions

Find out the arguments to a function:

    args(runif)
    args(mean)
    args(rnorm)

Can supply named arguments to functions.

If looking at a dataset like airquality there's NA specified in the middle.

Asking for the mean of this will return NA, unless you specify the na.rm argument

    min(airquality$Ozone, na.rm = TRUE)
    
#####Statistical Functions Built In

    sum(airquality$Ozone)
    quantile(airquality$Ozone)
    median(airquality$Ozone, na.rm=T)
    quantile(airquality$Wind, c(.05, .95))

There's also functions for poisson, binomial, weibull, and various distributions (uniform, logistic, geometric etc...)

Return a random sample:

    sample(1:10, 5)
    
Return the basic stats for the dataset:

    summary(airquality$Ozone)
    summary(airquality)

And query the dataset using various statements..

    table(airquality$Wind > 20)
    
Check whether values are missing:

    is.na(airquality$Ozone)
    
Invert with:

    !is.na(airquality$Ozone)
    
Table builds a contingency table of the counts of a various combination of factor levels.

    table(is.na(airquality$Ozone))
    
Omit na values with:

    na.omit(airquality$Ozone)
    
    replace(airquality$Ozone, is.na(airquality$Ozone), "GOPIGS")
    
#####Working with Character Data

    h <- "Hello World"
    substring(h, 1 ,5)
    gsub("Hello", "Hola", h)
    grep("World", h)
    grep1("World", h)
    paste(h, "Pigs")
    
###Writing Functions

    myfun <- function(x) {
        x + 2
    }
    
#####Variable Arguments

You can create a function to handle variable arguments.  Good example is the histrogram function, the remaining arguments refer to ones passed to the histogram function to specify display options:

    histfun <- function(n) {
        hist(rnorm(n))
    }

n.b. Print is automatically called here.  this does happen if you assign as the last line.

Create a function that takes a number of arguments and does something with it:

    sumfun <- function(...) {
        mylist <- sum(...)
    }
    
Invisible Returning, if i've assigned this then return it, otherwise don't bother

    addfun <- function(x, y) {
        w <- x + y
        invisible(w)
    }
    
#####Error Handling with Functions

    myfun <- function(x, y) {
  
        
        if (any(x) < 0 | length(y) > 5) stop("Length of variables should be < 5")
        if (length(x) > 5 | length(y) > 5) stop("Length of variables should be < 5")
        if (length(y) != length(x)) warn("Variables provided are NOT the same length")
        if (length(y) == length(x)) warn("Variables provided ARE same length")
      
      sum(log(x) + y) 
    }
    
You can use sprintf to format a string with a variable.

Can check the argument is of a SPECIFIC type.  But, you have to be careful

    is.vector(5) is true because it's a vector with a single value
    is.vector("Hello") is also true because it's a vector of characters
    
