### http://stackoverflow.com/questions/28952034/
# finding-partial-matches-on-strings-in-r/



## I have a very large database with names like this:
## 
## names <- c("William Gates", "Bill Gates", "Gates, William H. III", 
##     "Gates, William III", "William H Gates", "William H. Gates", 
##     "Carlos Slim Helu & family", "Carlos Slim Helu", 
##     "Carlos Slim & Family", "Carlos Slim")
## 
## which I would like to 'clean up' automatically like this:
## 
## new_names <- c("William Gates", "William Gates", "William Gates", 
##     "William Gates", "William Gates", "William Gates", 
##     "Carlos Slim Helu & family", "Carlos Slim Helu & family", 
##     "Carlos Slim Helu & family", "Carlos Slim Helu & family")
## 
## where I have (arbitrarily) used the first occurrence of the name to replace other variations of it.
## 
## In this example names is a character vector of length 10. I would like to create a 10 X 10 matrix of "partial match values". This matrix would store "measures" between 0 and 1 of the extent of the partial match. For instance, comparing names[1] with names[1] yields a perfect match, so the value would be 1; comparing names[1] with names[2] would yield something like 5/12 = 0.41667, reflecting the fact that Gates is common to both strings and that (ignoring empty strings) names[1] has 12 letters; by the same logic, comparing names[2] with names[1] would yield something like 5/9 = 0.55556.
## 
## I would probably ignore cases (family and Family would be a perfect match) and only focus on matching substrings (but if someone has a comment on how to match, say Slim and Silm, that would be excellent too.
## 
## As a second step, I would create a triangular matrix of the maximal values (in the example, the value 5/9 = 0.55556). I would then use this matrix to eye-ball the situation and to select a threshold like 0.95 above which strings are replaced, progressively lowering the threshold until I feel satisfied that the data has been cleaned up.
## 
## I expect that this sort of thing has been done before and that someone will be able to help me get started. I have read about Paul Murrell's compare package and expect that it would be a great tool to use, but I have not seen too many examples that could be readily adapted, so if you know of a tutorial or of examples other than the package vignette, please do point me to them.
## 
## I do realize that more code would be expected of a good question, and I apologize for not being able to provide much. While I am reasonably familiar with R, I am not with string matching. If someone points me to some place to get started, I can then try to rephrase my question with some example code.


### ANSWER 1


## Full answer based on adist and clustering.
## 
## With arguments partial=TRUE and ignore.case=TRUE, the function adist from base R seems to work with the problem. For the long haul, the library stringdist that Chris S pointed out seems promising but could also work with this approach.
## 
## This solution uses clustering via hclust, employing the 'single linkage' method that takes a 'friends of friends' approach suited to this problem.
## 
## Note that this requires choosing a threshold based on cluster height (in this case accumulated generalized Levenshtein distance between the names as viewed through the single-link criterion). If clustering isn't too expensive for your problem, than visualizing or inspecting the output of hclust shouldn't be too bad either.

## renamed to avoid overwriting names() function
raw_names <- c("William Gates", "Bill Gates", "Gates, William H. III", 
  "Gates, William III", "William H Gates", "William H. Gates", 
  "Carlos Slim Helu & family", "Carlos Slim Helu", 
  "Carlos Slim & Family", "Carlos Slim")

lev_dist <- adist(raw_names, raw_names, partial=TRUE, ignore.case=TRUE)

#use single linkage method as it suits the problem
hc <- hclust(as.dist(lev_dist), method='single')

## cluster vis for picking threshold
plot(hc, labels=raw_names)
threshold <- 6 ## in terms of cluster height --

## based on threshold, get clusters and make labels
cluster <- cutree(hc, h=threshold)
cluster_labels <- sapply(unique(cluster), function(i) raw_names[min(which(cluster == i))])
(new_names <- cluster_labels[cluster])

##  [1] "William Gates" "William Gates" "William Gates"
## "Carlos Slim Helu & family" "Carlos Slim Helu & family" [6]
## "William Gates" "William Gates" "William Gates"
## "Carlos Slim Helu & family" "Carlos Slim Helu & family"


### ANSWER 2



## Here is a simple attempt. just using a built in function and not creating any matrix, but it seems to work on this simple example.

names <- c("William Gates", "Bill Gates", "Gates, William H. III", 
           "Gates, William III", "William H Gates", "William H. Gates", 
           "Carlos Slim Helu & family", "Carlos Slim Helu", 
           "Carlos Slim & Family", "Carlos Slim")

new_names <- c("William Gates", "William Gates", "William Gates", 
               "William Gates", "William Gates", "William Gates", 
               "Carlos Slim Helu & family", "Carlos Slim Helu & family", 
               "Carlos Slim Helu & family", "Carlos Slim Helu & family")

nn <- c('Bill Gates','Carlos Slim')


cbind(names, sapply(nn, function(x) 
  ifelse(agrepl(x, names, max.distance = 5), x, NA)))

#      names                       Bill Gates   Carlos Slim  
# [1,] "William Gates"             "Bill Gates" NA           
# [2,] "Bill Gates"                "Bill Gates" NA           
# [3,] "Gates, William H. III"     "Bill Gates" NA           
# [4,] "Gates, William III"        "Bill Gates" NA           
# [5,] "William H Gates"           "Bill Gates" NA           
# [6,] "William H. Gates"          "Bill Gates" NA           
# [7,] "Carlos Slim Helu & family" NA           "Carlos Slim"
# [8,] "Carlos Slim Helu"          NA           "Carlos Slim"
# [9,] "Carlos Slim & Family"      NA           "Carlos Slim"
# [10,] "Carlos Slim"               NA           "Carlos Slim"

# another option that comes to mind would be sorting out the frequent occurrences of all names and providing some cut-off and using that instead of making the comparison by hand.

names <- c("William Gates", "Bill Gates", "Gates, William H. III", 
           "Gates, William III", "William H Gates", "William H. Gates", 
           "Carlos Slim Helu & family", "Carlos Slim Helu", 
           "Carlos Slim & Family", "Carlos Slim")

names <- gsub('[[:punct:]]', '', names)
nn <- sort(table(unlist(strsplit(names, ' '))))
nn <- names(nn[nn >= 4])

cbind(names, sapply(nn, function(x) 
  ifelse(agrepl(x, names, max.distance = 1), x, NA)))

#      names                      Carlos   Slim   William   Gates  
# [1,] "William Gates"            NA       NA     "William" "Gates"
# [2,] "Bill Gates"               NA       NA     NA        "Gates"
# [3,] "Gates William H III"      NA       NA     "William" "Gates"
# [4,] "Gates William III"        NA       NA     "William" "Gates"
# [5,] "William H Gates"          NA       NA     "William" "Gates"
# [6,] "William H Gates"          NA       NA     "William" "Gates"
# [7,] "Carlos Slim Helu  family" "Carlos" "Slim" NA        NA     
# [8,] "Carlos Slim Helu"         "Carlos" "Slim" NA        NA     
# [9,] "Carlos Slim  Family"      "Carlos" "Slim" NA        NA     
# [10,] "Carlos Slim"              "Carlos" "Slim" NA        NA   


### ANSWER 3



## The stringdist package might help to get the matrix - it's also described in the June 2014 R journal.

library(stringdist)
stringdistmatrix(names, names)
##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
##  [1,]    0    4   13   12    2    3   20   13   15    11
##  [2,]    4    0   17   15    6    7   21   13   16    10
##  [3,]   13   17    0    3   13   12   20   14   17    16
##  [4,]   12   15    3    0   14   15   20   13   16    13
##  ...

