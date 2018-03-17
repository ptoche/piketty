### Plot Income Distribution from Dorling (2015)
##  Data: Danny Dorling, "Data on Income Inequality in Germany, France, Italy, Spain, the UK, and other Affluent Nations, 2012," Data in Brief, Volume 5, Pages 458-460. 
## http://www.sciencedirect.com/science/article/pii/S2352340915002176
## http://www.ncbi.nlm.nih.gov/pubmed/26594656

### Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/piketty/extra/Dorling - 2015 - Income Inequality")
} else { 
  setwd("~/piketty/extra/Dorling - 2015 - Income Inequality") 
}

### Table 1
library("xlsx")
df <- read.xlsx("Data/Table1.xlsx",
                sheetName = "Data", 
                rowIndex = 1:3821, 
                colIndex = 1:6, 
                header = TRUE, 
                stringsAsFactors = FALSE)
View(df)
colnames(df)[1] <- "Income"
df[, "units"] <- "Number of individuals (gross annual income, euros)"
library("reshape2")
df <- melt(df, id = "Income")
df$value <- as.numeric(df$value)
df$Income <- as.integer(df$Income)
df <- na.omit(df)
str(df)
#save(df, file = "Data/annual-income-table1.RData")

### Table 2
library("xlsx")
df <- read.xlsx("Data/Table2.xlsx",
                sheetName = "Data", 
                rowIndex = 1:3821, 
                colIndex = 1:6, 
                header = TRUE, 
                stringsAsFactors = FALSE)
View(df)
colnames(df)[1] <- "Income"
df[, "units"] <- "Gross annual income (euros)"
library("reshape2")
df <- melt(df, id = "Income")
df$value <- as.numeric(df$value)
df$Income <- as.integer(df$Income)
df <- na.omit(df)
str(df)
#save(df, file = "Data/annual-income-table2.RData")
