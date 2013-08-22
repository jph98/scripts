###Packages

Show all packages:

    search()

Display the package search pths

    searchpaths()

Display all objects in a package:

    objects("package:datasets")

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
    
#####Vector, c function, 

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
    
#####Sequences

    seq(from = 1, to = 4)
    
#####Repeat a character ten times

    rep(1, 10)
    rep(c(1,2,3), 10)
    
You can mix this up, but the types get coerced 

    LOGICAL > NUMERIC > CHARACTER
    
Truthiness!
    
###Text Handling

#####Printing Text

    print("blah)

#####Concatenating Text

    print(paste("Wrote ", name))
    
###Dataframes

    data.frame(time = cdata[,c(2)], mempagein = cdata[,c(41)] / 1000)
