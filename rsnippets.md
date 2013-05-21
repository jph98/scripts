###Installation

#####Installing an R package

    R CMD INSTALL mangoTraining_1.0-6.tar.gz
    
or:

    install.packages("mangoTraining")

from a different repository:

    install.packages("mangoTraining",repos="http://rpackages.mango.local")
    
###Capabilities

    capabilities()
    
###Reading Arguments

    args <- commandArgs(trailingOnly = TRUE)
    collectdir <- args[1]
    resultsfile <- args[2]
    
###Text Handling

#####Printing Text

    print("blah)

#####Concatenating Text

    print(paste("Wrote ", name))
    
###Dataframes

    data.frame(time = cdata[,c(2)], mempagein = cdata[,c(41)] / 1000)
