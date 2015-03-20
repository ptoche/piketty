### Data Source: Forbes Magazine 1996-2015
setwd("~/piketty/extra/Wealthiest - 2015/")


### Step 1. Read and merge data
library("xlsx") 

## 1996
df <- read.xlsx("data/forbes/forbes-1996-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Wealth", "Country")
df$Year <- 1996

## 1997 
df0 <- df
df <- read.xlsx("data/forbes/forbes-1997-world-top200.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Company/Industry", "Wealth")
df$Year <- 1997
df0 <- merge(df, df0, all = TRUE)

## 1998
df <- read.xlsx("data/forbes/forbes-1998-world-top200.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Wealth", "Country")
df$Year <- 1998
df0 <- merge(df, df0, all = TRUE)

## 1999
df <- read.xlsx("data/forbes/forbes-1999-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Wealth", "Country")
df$Year <- 1999
df0 <- merge(df, df0, all = TRUE)

## 2000
df <- read.xlsx("data/forbes/forbes-2000-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Wealth", "Country")
df$Year <- 2000
df0 <- merge(df, df0, all = TRUE)

## 2001
df <- read.xlsx("data/forbes/forbes-2001-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Wealth", "Country")
df$Year <- 2001
df0 <- merge(df, df0, all = TRUE)

## 2002
df <- read.xlsx("data/forbes/forbes-2002-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Wealth", "Country")
df$Year <- 2002
df0 <- merge(df, df0, all = TRUE)

## 2003
df <- read.xlsx("data/forbes/forbes-2003-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Age", "Wealth", "Country")
df$Year <- 2003
df0 <- merge(df, df0, all = TRUE)

## 2004
df <- read.xlsx("data/forbes/forbes-2004-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Age", "Wealth", "Country")
df$Year <- 2004
df0 <- merge(df, df0, all = TRUE)

## 2005
df <- read.xlsx("data/forbes/forbes-2005-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Age", "Wealth", "Country")
df$Year <- 2005
df0 <- merge(df, df0, all = TRUE)

## 2006
df <- read.xlsx("data/forbes/forbes-2006-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Residence")
df$Year <- 2006
df0 <- merge(df, df0, all = TRUE)

## 2007
df <- read.xlsx("data/forbes/forbes-2007-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Residence")
df$Year <- 2007
df0 <- merge(df, df0, all = TRUE)

## 2008
df <- read.xlsx("data/forbes/forbes-2008-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Residence")
df$Year <- 2008
df0 <- merge(df, df0, all = TRUE)

## 2009
df <- read.xlsx("data/forbes/forbes-2009-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Residence")
df$Year <- 2009
df0 <- merge(df, df0, all = TRUE)

## 2010
df <- read.xlsx("data/forbes/forbes-2010-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Residence")
df$Year <- 2010
df0 <- merge(df, df0, all = TRUE)

## 2011
df <- read.xlsx("data/forbes/forbes-2011-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Company/Industry")
df$Year <- 2011
df0 <- merge(df, df0, all = TRUE)

## 2012
df <- read.xlsx("data/forbes/forbes-2012-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Company/Industry")
df$Year <- 2012
df0 <- merge(df, df0, all = TRUE)

## 2013
df <- read.xlsx("data/forbes/forbes-2013-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Company/Industry")
df$Year <- 2013
df0 <- merge(df, df0, all = TRUE)

## 2014
df <- read.xlsx("data/forbes/forbes-2014-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Age", "Wealth", "Country")
df$Year <- 2014
df0 <- merge(df, df0, all = TRUE)

## 2015
df <- read.xlsx("data/forbes/forbes-2015-world-billionaires.xls", 
    sheetName = "Sheet1", header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Rank", "Name", "Country", "Age", "Wealth", "Company/Industry")
df$Year <- 2015
df <- merge(df, df0, all = TRUE) # reverting to df, not df0

# save first version of dataframe
save(df, file = "data/df1.Rda")

### Step 2. Clean data
setwd("~/piketty/extra/Wealthiest - 2015/")
load("data/df1.Rda")

## Convenience function
## returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

df$Name <- trim(df$Name)
df$Country <- trim(df$Country)
df$Residence <- trim(df$Residence)
df[,'Company/Industry'] <- trim(df[,'Company/Industry'])
df$Wealth <- as.numeric(df$Wealth)
df$Age <- as.numeric(df$Age)# forces e.g. 55/57 to NA, to be improved

# Create a clean string of names
Names <- subset(df, Year == 1996)$Name  # surname, name format


# name groups 'first' and 'last'
name.rex <- "(?<first>[[:upper:]][[:lower:]]+) (?<last>[[:upper:]][[:lower:]]+)"
(parsed <- regexpr(name.rex, Names, perl = TRUE))
gregexpr(name.rex, Names, perl = TRUE)[[2]]
parse.one <- function(res, result) {
  m <- do.call(rbind, lapply(seq_along(res), function(i) {
    if(result[i] == -1) return(NULL)
    st <- attr(result, "capture.start")[i, ]
    substring(res[i], st, st + attr(result, "capture.length")[i, ] - 1)
  }))
  colnames(m) <- attr(result, "capture.names")
  m
}
parse.one(Names, parsed)



Names <- gsub('[[:punct:]]', ' ', Names)  # remove punctuation
N <- sort(table(unlist(strsplit(Names, ' '))))
N <- names(N[N >= 4])

d <- cbind(Names, sapply(N, function(x) 
  ifelse(agrepl(x, names, max.distance = 1), x, NA)))

