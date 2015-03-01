### National Income Shares
### Data Source: Piketty, Capital in the Twenty-First Century,  2014.

setwd("~/piketty/knitr/slides/extra")
library("xlsx")
library("reshape2")

## Income Shares: France
TS8.1 <- read.xlsx("../../Piketty2014FiguresTables/Chapter8TablesFigures.xlsx",
  sheetName = "TS8.1", rowIndex = 6:116, colIndex = 1:6, header = FALSE)
names(TS8.1) <- c("Year", "france_top_10_is_wok", "france_top_1_is_wok", "france_top_01_is_wok", "france_top_10_ws", "france_top_1_ws")
df_8_1Xa <- TS8.1[, c("Year", "france_top_01_is_wok")]
df_8_1Xa$Share <- "Top 0.1%"
df_8_1Xa$Category <- "Income Share"
df_8_1Xa$Detail <- "Excluding Capital Gains"
df_8_1Xa <- melt(df_8_1Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_1Xb <- TS8.1[, c("Year", "france_top_1_is_wok")]
df_8_1Xb$Share <- "Top 1%"
df_8_1Xb$Category <- "Income Share"
df_8_1Xb$Detail <- "Excluding Capital Gains"
df_8_1Xb <- melt(df_8_1Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_1Xc <- TS8.1[, c("Year", "france_top_10_is_wok")]
df_8_1Xc$Share <- "Top 10%"
df_8_1Xc$Category <- "Income Share"
df_8_1Xc$Detail <- "Excluding Capital Gains"
df_8_1Xc <- melt(df_8_1Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_1X <- rbind(df_8_1Xa, df_8_1Xb, df_8_1Xc)
df_8_1X$Country <- "France"


## Income Shares: USA
TS8.2 <- read.xlsx("../../Piketty2014FiguresTables/Chapter8TablesFigures.xlsx",
  sheetName = "TS8.2", rowIndex = 6:116, colIndex = 1:11, header = FALSE)
names(TS8.2) <- c("Year", "usa_top_10_is", "usa_top_10_5_is", "usa_top_5_1_is", "usa_top_1_is", "usa_top_01_is", "usa_top_10_is_wok", "usa_top_1_is_wok", "usa_top_01_is_wok", "usa_top_10_ws", "usa_top_1_ws")
df_8_2Xa <- TS8.2[, c("Year", "usa_top_01_is")]
df_8_2Xa$Share <- "Top 0.1%"
df_8_2Xa$Category <- "Income Share"
df_8_2Xa$Detail <- "Including Capital Gains"
df_8_2Xa <- melt(df_8_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xb <- TS8.2[, c("Year", "usa_top_1_is")]
df_8_2Xb$Share <- "Top 1%"
df_8_2Xb$Category <- "Income Share"
df_8_2Xb$Detail <- "Including Capital Gains"
df_8_2Xb <- melt(df_8_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xc <- TS8.2[, c("Year", "usa_top_10_is")]
df_8_2Xc$Share <- "Top 10%"
df_8_2Xc$Category <- "Income Share"
df_8_2Xc$Detail <- "Including Capital Gains"
df_8_2Xc <- melt(df_8_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xd <- TS8.2[, c("Year", "usa_top_01_is_wok")]
df_8_2Xd$Share <- "Top 0.1%"
df_8_2Xd$Category <- "Income Share"
df_8_2Xd$Detail <- "Excluding Capital Gains"
df_8_2Xd <- melt(df_8_2Xd, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xe <- TS8.2[, c("Year", "usa_top_1_is_wok")]
df_8_2Xe$Share <- "Top 1%"
df_8_2Xe$Category <- "Income Share"
df_8_2Xe$Detail <- "Excluding Capital Gains"
df_8_2Xe <- melt(df_8_2Xe, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xf <- TS8.2[, c("Year", "usa_top_10_is_wok")]
df_8_2Xf$Share <- "Top 10%"
df_8_2Xf$Category <- "Income Share"
df_8_2Xf$Detail <- "Excluding Capital Gains"
df_8_2Xf <- melt(df_8_2Xf, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2X <- rbind(df_8_2Xa, df_8_2Xb, df_8_2Xc, df_8_2Xd, df_8_2Xe, df_8_2Xf)
df_8_2X$Country <- "United States"


## Income Shares: UK, Germany, Sweden, Japan
TS9.2 <- read.xlsx("../../Piketty2014FiguresTables/Chapter9TablesFigures.xlsx",
  sheetName = "TS9.2", rowIndex = 6:116, colIndex = 1:12, header = FALSE)
names(TS9.2) <- c("Year", "uk_top_10_is_wok","uk_top_1_is_wok", "uk_top_01_is_wok", "germany_top_10_is_wok", "germany_top_1_is_wok", "germany_top_01_is_wok", "sweden_top_10_is_wok", "sweden_top_1_is_wok", "sweden_top_01_is_wok", "japan_top_1_is_wok", "japan_top_01_is_wok")
df_9_2Xa <- TS9.2[, c("Year", "uk_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "uk_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xc <- TS9.2[, c("Year", "uk_top_10_is_wok")]
df_9_2Xc$Share <- "Top 10%"
df_9_2Xc$Category <- "Income Share"
df_9_2Xc$Detail <- "Excluding Capital Gains"
df_9_2Xc <- melt(df_9_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb, df_9_2Xc)
df_9_2X$Country <- "United Kingdom"
df_9_2X1 <- df_9_2X

df_9_2Xa <- TS9.2[, c("Year", "germany_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "germany_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xc <- TS9.2[, c("Year", "germany_top_10_is_wok")]
df_9_2Xc$Share <- "Top 10%"
df_9_2Xc$Category <- "Income Share"
df_9_2Xc$Detail <- "Excluding Capital Gains"
df_9_2Xc <- melt(df_9_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb, df_9_2Xc)
df_9_2X$Country <- "Germany"
df_9_2X2 <- df_9_2X

df_9_2Xa <- TS9.2[, c("Year", "sweden_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "sweden_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xc <- TS9.2[, c("Year", "sweden_top_10_is_wok")]
df_9_2Xc$Share <- "Top 10%"
df_9_2Xc$Category <- "Income Share"
df_9_2Xc$Detail <- "Excluding Capital Gains"
df_9_2Xc <- melt(df_9_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb, df_9_2Xc)
df_9_2X$Country <- "Sweden"
df_9_2X3 <- df_9_2X

df_9_2Xa <- TS9.2[, c("Year", "japan_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "japan_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb)
df_9_2X$Country <- "Japan"
df_9_2X4 <- df_9_2X

## Merge dataframes
df_9_2X <- rbind(df_9_2X1, df_9_2X2, df_9_2X3, df_9_2X4)

rm(list=ls())

## Income Shares: Canada, Australia, New Zealand, Denmark, Italy, Netherlands, Spain
TS9.3 <- read.xlsx("../../Piketty2014FiguresTables/Chapter9TablesFigures.xlsx",
  sheetName = "TS9.3", rowIndex = 6:116, colIndex = 1:15, header = FALSE)
names(TS9.3) <- c("Year", "canada_top_1_is_wok", "canada_top_01_is_wok", "australia_top_1_is_wok","australia_top_01_is_wok", "nzl_top_1_is_wok", "nzl_top_01_is_wok", "denmark_top_1_is_wok","denmark_top_01_is_wok","italy_top_1_is_wok","italy_top_01_is_wok", "holland_top_1_is_wok","holland_top_01_is_wok","spa_top_1_is_wok","spa_top_01_is_wok")
df_9_3Xa <- TS9.3[, c("Year", "canada_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "canada_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Canada"
df_9_3X1 <- df_9_3X

df_9_3Xa <- TS9.3[, c("Year", "australia_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "australia_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Australia"
df_9_3X2 <- df_9_3X

df_9_3Xa <- TS9.3[, c("Year", "nzl_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "nzl_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "New Zealand"
df_9_3X3 <- df_9_3X

df_9_3Xa <- TS9.3[, c("Year", "denmark_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "denmark_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Denmark"
df_9_3X4 <- df_9_3X

df_9_3Xa <- TS9.3[, c("Year", "italy_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "italy_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Italy"
df_9_3X5 <- df_9_3X

df_9_3Xa <- TS9.3[, c("Year", "holland_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "holland_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Netherlands"
df_9_3X6 <- df_9_3X

df_9_3Xa <- TS9.3[, c("Year", "spa_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "spa_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Spain"
df_9_3X6 <- df_9_3X

## Merge dataframes
df_9_3X <- rbind(df_9_3X1, df_9_3X2, df_9_3X3, df_9_3X4, df_9_3X5, df_9_3X6)

### Income Shares: All Countries
df_is <- rbind(df_8_1X, df_8_2X, df_9_2X, df_9_3X)
df_is$Name <- df_is$variable
df_is$variable <- paste0(df_is$Country, ": ", df_is$Share, " ", df_is$Category, " (", df_is$Detail, ")")
df_is$variable0 <- paste0(df_is$Country, ": ", df_is$Share, " ", df_is$Category)
df_is <- subset(df_is, select = c("Year", "Country", "Share", "Category", "Detail", "Name", "variable0", "variable", "value"))
df_is <- na.omit(df_is)
row.names(df_is) <- NULL
save(df_is, file = "data/df_is.Rda")


rm(list=ls())


### National Income
### Data Source: Piketty & Zucman, Capital is Back,  2013.

## Aggregate National Income
setwd("~/piketty/knitr/slides/extra")
library("xlsx")
library("reshape2")

df_AU <- read.xlsx("../../PikettyZucman2013Data/Australia.xls",
  sheetName = "Table AU.1", rowIndex = 9:60, colIndex = c(1,4), header = FALSE)
names(df_AU) <- c("Year", "Australia: National Income (2010 Billion Australian Dollars)")
df_AU$Country <- "Australia"
df_AU$Share <- "100%"
df_AU$Category <- "National Income"
df_AU$Detail <- "2010 Billion Australian Dollars"
df_AU <- melt(df_AU, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_CA <- read.xlsx("../../PikettyZucman2013Data/Canada.xls",
  sheetName = "Table CA.1", rowIndex = 9:60, colIndex = c(1,4), header = FALSE)
names(df_CA) <- c("Year", "Canada: National Income (2010 Billion Canadian Dollars)")
df_CA$Country <- "Canada"
df_CA$Share <- "100%"
df_CA$Category <- "National Income"
df_CA$Detail <- "2010 Billion Canadian Dollars"
df_CA <- melt(df_CA, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_FR <- read.xlsx("../../PikettyZucman2013Data/France.xls",
  sheetName = "Table FR.1", rowIndex = 9:199, colIndex = c(1,4), header = FALSE)
names(df_FR) <- c("Year", "France: National Income (2010 Billion Euros)")
df_FR$Country <- "France"
df_FR$Share <- "100%"
df_FR$Category <- "National Income"
df_FR$Detail <- "2010 Billion Euros"
df_FR <- melt(df_FR, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_DE <- read.xlsx("../../PikettyZucman2013Data/Germany.xls",
  sheetName = "TableDE1", rowIndex = 10:151, colIndex = c(1,4), header = FALSE)
names(df_DE) <- c("Year", "Germany: National Income (2010 Billion Euros)")
df_DE$Country <- "Germany"
df_DE$Share <- "100%"
df_DE$Category <- "National Income"
df_DE$Detail <- "2010 Billion Euros"
df_DE <- melt(df_DE, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_IT <- read.xlsx("../../PikettyZucman2013Data/Italy.xls",
  sheetName = "Table IT.1", rowIndex = 9:60, colIndex = c(1,4), header = FALSE)
names(df_IT) <- c("Year", "Italy: National Income (2010 Billion Euros)")
df_IT$Country <- "Italy"
df_IT$Share <- "100%"
df_IT$Category <- "National Income"
df_IT$Detail <- "2010 Billion Euros"
df_IT <- melt(df_IT, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_JP <- read.xlsx("../../PikettyZucman2013Data/Japan.xls",
  sheetName = "Table JP.1", rowIndex = 9:69, colIndex = c(1,4), header = FALSE)
names(df_JP) <- c("Year", "Japan: National Income (2010 Trillion Yens)")
df_JP$Country <- "Japan"
df_JP$Share <- "100%"
df_JP$Category <- "National Income"
df_JP$Detail <- "2010 Trillion Yens"
df_JP <- melt(df_JP, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_ES <- read.xlsx("../../PikettyZucman2013Data/Spain.xls",
  sheetName = "Table ES.1", rowIndex = 9:49, colIndex = c(1,4), header = FALSE)
names(df_ES) <- c("Year", "Spain: National Income (2010 Billion Euros)")
df_ES$Country <- "Spain"
df_ES$Share <- "100%"
df_ES$Category <- "National Income"
df_ES$Detail <- "2010 Billion Euros"
df_ES <- melt(df_ES, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_UK <- read.xlsx("../../PikettyZucman2013Data/UK.xls",
  sheetName = "TableUK1", rowIndex = 10:166, colIndex = c(1,4), header = FALSE)
names(df_UK) <- c("Year", "United Kingdom: National Income (2010 Billion Pounds)")
df_UK$Country <- "United Kingdom"
df_UK$Share <- "100%"
df_UK$Category <- "National Income"
df_UK$Detail <- "2010 Billion Pounds"
df_UK <- melt(df_UK, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_US <- read.xlsx("../../PikettyZucman2013Data/USA.xlsx",
  sheetName = "TableUS1", rowIndex = 9:150, colIndex = c(1,4), header = FALSE)
names(df_US) <- c("Year", "United States: National Income (2010 Billion Dollars)")
df_US$Country <- "United States"
df_US$Share <- "100%"
df_US$Category <- "National Income"
df_US$Detail <- "2010 Billion Dollars"
df_US <- melt(df_US, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

## Aggregate National Income: All Countries
df_ni <- rbind(df_AU, df_CA, df_FR, df_DE, df_IT, df_JP, df_ES, df_UK, df_US)
save(df_ni, file = "data/df_ni.Rda")


rm(list=ls())


### National Income Per Capita
setwd("~/piketty/knitr/slides/extra")
library("xlsx")
library("reshape2")

df_AU <- read.xlsx("../../PikettyZucman2013Data/Australia.xls",
  sheetName = "Table AU.1", rowIndex = 9:60, colIndex = c(1,10), header = FALSE)
names(df_AU) <- c("Year", "Australia: National Income Per Capita (2010 Billion Australian Dollars)")
df_AU$Country <- "Australia"
df_AU$Share <- "100%"
df_AU$Category <- "National Income Per Capita"
df_AU$Detail <- "2010 Billion Australian Dollars"
df_AU <- melt(df_AU, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_CA <- read.xlsx("../../PikettyZucman2013Data/Canada.xls",
  sheetName = "Table CA.1", rowIndex = 9:60, colIndex = c(1,10), header = FALSE)
names(df_CA) <- c("Year", "Canada: National Income Per Capita (2010 Billion Canadian Dollars)")
df_CA$Country <- "Canada"
df_CA$Share <- "100%"
df_CA$Category <- "National Income Per Capita"
df_CA$Detail <- "2010 Billion Canadian Dollars"
df_CA <- melt(df_CA, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_FR <- read.xlsx("../../PikettyZucman2013Data/France.xls",
  sheetName = "Table FR.1", rowIndex = 9:199, colIndex = c(1,10), header = FALSE)
names(df_FR) <- c("Year", "France: National Income Per Capita (2010 Billion Euros)")
df_FR$Country <- "France"
df_FR$Share <- "100%"
df_FR$Category <- "National Income Per Capita"
df_FR$Detail <- "2010 Billion Euros"
df_FR <- melt(df_FR, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_DE <- read.xlsx("../../PikettyZucman2013Data/Germany.xls",
  sheetName = "TableDE1", rowIndex = 10:151, colIndex = c(1,10), header = FALSE)
names(df_DE) <- c("Year", "Germany: National Income Per Capita (2010 Billion Euros)")
df_DE$Country <- "Germany"
df_DE$Share <- "100%"
df_DE$Category <- "National Income Per Capita"
df_DE$Detail <- "2010 Billion Euros"
df_DE <- melt(df_DE, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_IT <- read.xlsx("../../PikettyZucman2013Data/Italy.xls",
  sheetName = "Table IT.1", rowIndex = 9:60, colIndex = c(1,10), header = FALSE)
names(df_IT) <- c("Year", "Italy: National Income Per Capita (2010 Billion Euros)")
df_IT$Country <- "Italy"
df_IT$Share <- "100%"
df_IT$Category <- "National Income Per Capita"
df_IT$Detail <- "2010 Billion Euros"
df_IT <- melt(df_IT, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_JP <- read.xlsx("../../PikettyZucman2013Data/Japan.xls",
  sheetName = "Table JP.1", rowIndex = 9:69, colIndex = c(1,10), header = FALSE)
names(df_JP) <- c("Year", "Japan: National Income Per Capita (2010 Trillion Yens)")
df_JP$Country <- "Japan"
df_JP$Share <- "100%"
df_JP$Category <- "National Income Per Capita"
df_JP$Detail <- "2010 Trillion Yens"
df_JP <- melt(df_JP, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_ES <- read.xlsx("../../PikettyZucman2013Data/Spain.xls",
  sheetName = "Table ES.1", rowIndex = 9:49, colIndex = c(1,10), header = FALSE)
names(df_ES) <- c("Year", "Spain: National Income Per Capita (2010 Billion Euros)")
df_ES$Country <- "Spain"
df_ES$Share <- "100%"
df_ES$Category <- "National Income Per Capita"
df_ES$Detail <- "2010 Billion Euros"
df_ES <- melt(df_ES, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_UK <- read.xlsx("../../PikettyZucman2013Data/UK.xls",
  sheetName = "TableUK1", rowIndex = 10:166, colIndex = c(1,10), header = FALSE)
names(df_UK) <- c("Year", "United Kingdom: National Income Per Capita (2010 Billion Pounds)")
df_UK$Country <- "United Kingdom"
df_UK$Share <- "100%"
df_UK$Category <- "National Income Per Capita"
df_UK$Detail <- "2010 Billion Pounds"
df_UK <- melt(df_UK, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_US <- read.xlsx("../../PikettyZucman2013Data/USA.xlsx",
  sheetName = "TableUS1", rowIndex = 9:150, colIndex = c(1,10), header = FALSE)
names(df_US) <- c("Year", "United States: National Income Per Capita (2010 Billion Dollars)")
df_US$Country <- "United States"
df_US$Share <- "100%"
df_US$Category <- "National Income Per Capita"
df_US$Detail <- "2010 Billion Dollars"
df_US <- melt(df_US, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

## National Income Per Capita: All Countries
df_ni_pc <- rbind(df_AU, df_CA, df_FR, df_DE, df_IT, df_JP, df_ES, df_UK, df_US)
save(df_ni_pc, file = "data/df_ni_pc.Rda")


rm(list=ls())

