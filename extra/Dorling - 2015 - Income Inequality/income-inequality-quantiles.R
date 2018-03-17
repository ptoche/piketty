### Compute Income Shares by Quantiles

### Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/piketty/extra/Dorling - 2015 - Income Inequality")
} else { 
  setwd("~/piketty/extra/Dorling - 2015 - Income Inequality") 
}

### Get Data
library("xlsx")
df <- read.xlsx("Data/Table1.xlsx",
                sheetName = "Data", 
                rowIndex = 1:3821, 
                colIndex = 1:6, 
                header = TRUE, 
                stringsAsFactors = FALSE)
View(df)
colnames(df)[1] <- "Income"

# Round values and convert to integers (the values are 'weighted' households).
df$Income <- as.integer(df$Income)
df[, -1] <- sapply(df[, -1], function(x) as.integer(round(x,0)))



### Make Quantiles
Q.countries <- paste("Q", countries, sep = ".")
makeQuantile <- function(data, cols = data[,-1], probs = seq(0,1,0.2), na.rm = TRUE, include.lowest = TRUE, add.jitter = FALSE) {
    for (col in cols) {
        name <- paste("Q", col, sep = ".")
        data.unique <- data[cumsum(rle(as.numeric(data[, col]))$lengths), ]
        breaks <- quantile(data.unique[, col], probs = probs, na.rm = na.rm)
        if (add.jitter) breaks <- breaks + seq_along(breaks) * .Machine$double.eps
        data[, name] <- NA
        data[, name] <- cut(data[, col], breaks = breaks, include.lowest = include.lowest)
    }
    return(data)
}
## apply function to data and selected variables
countries <- c("Germany", "France", "Italy", "Spain", "UK")
quantiles <- seq(0, 100, 1)
df <- makeQuantile(data = df, cols = countries, probs = quantiles/100, na.rm = TRUE)



### Convert quantiles to numeric values
q.countries <- paste("q", countries, sep = ".")
makeNumeric <- function(data, cols) {
    for (col in cols) {
        name <- paste("q", col, sep = ".")
        col <- paste("Q", col, sep = ".")
        data[, name] <- as.integer(as.numeric(data[, col]))
    }
    return(data)
}
## apply function to data and selected variables
df <- makeNumeric(data = df, cols = countries)


#save(df, file = "Data/annual-income-table1-quantiles-1.RData")
#load(file = "Data/annual-income-table1-quantiles-1.RData")



### Find mid-point income for each interval (bin)
Y.countries <- paste("Y", countries, sep = ".")
meanIncome <- function(data, cols) {
    for (col in cols) {
        name <- paste("Y", col, sep = ".")
        rows <- cumsum(rle(data[, col])$lengths)
        data[, name] <- NA
        # set first row value (I could have introduced a 0-income row instead!
        data[1, name] <- as.integer(mean(c(data[1, "Income"], 0L)))
        for (row in rows[-1]) {
            data[row, name] <- as.integer(mean(c(data[rows[match(row,rows)], "Income"], data[rows[match(row,rows)-1], "Income"])))
        }
    }
    return(data)
}
## apply function to data and selected variables
df <- meanIncome(data = df, cols = countries)



### Find population within each interval (bin)
N.countries <- paste("N", countries, sep = ".")
popDist <- function(data, cols) {
    for (col in cols) {
        name <- paste("N", col, sep = ".")
        rows <- cumsum(rle(data[, col])$lengths)
        data[, name] <- NA
        # set first row value (I could have introduced a 0-income row instead!
        data[1, name] <- data[1, col]
        for (row in rows[-1]) {
            data[row, name] <- data[rows[match(row,rows)], col] - data[rows[match(row,rows)-1], col]
        }
    }
    return(data)
}
## apply function to data and selected variables
df <- popDist(data = df, cols = countries)


### check calculations
## cumulated sum of differences should coincide with original data
## Check column by column, then generalized to checkSum() function
##  col <- "N.Germany"
##  name <- paste("cumsum", col, sep = ".")
##  d <- df[, c("Income", col)]
##  d[, name] <- NA
##  d[1, name] <- d[1, col]
##  for (i in 2:nrow(d)) {
##    if (is.na(d[i, col])) d[i, name] <- 0
##    if (!(is.na(d[i, col]))) d[i, name] <- d[i, col]+d[i-1, name]
##    if (is.na(d[i, col])) d[i, name] <- d[i-1, name]
##  }
##  tail(d, n=1)[, name]
##  # [1] 40115100
##  df$Germany[nrow(df)]
##  # [1] 40115100 # total number of households surveyed

cumsum.countries <- paste("cumsum", countries, sep = ".")
checkSum <- function(data, cols) {
    for (col in cols) {
        data[, col] <- as.double(data[, col])
        name <- paste("cumsum", col, sep = ".")
        data[, name] <- NA
        col <- paste("N", col, sep = ".") # !recycle col name!
        data[1, name] <- data[1, col]
        for (i in 2:nrow(data)) {
            if (is.na(data[i, col])) {
                data[i, name] <- 0
            }
            if (!(is.na(data[i, col]))) {
                data[i, name] <- data[i, col] + data[i-1, name]
            }
            if (is.na(data[i, col])) {
                data[i, name] <- data[i-1, name]
            }
        }
    }
    return(tail(data, n=1))
}
## apply function to data and selected variables
checkSum(data = df, cols = countries)[,cumsum.countries]
## cumsum.Germany cumsum.France cumsum.Italy cumsum.Spain cumsum.UK
## 40115100       27750400      25336000     17433700     27963800

# return the last row, corresponding to the cdf at the upper bound
df[nrow(df),countries]
## Germany  France   Italy    Spain    UK
## 40115100 27750400 25336000 17433700 27963800


## Data checked successfully!


#save(df, file = "Data/annual-income-table1-quantiles-2.RData")
#load(file = "Data/annual-income-table1-quantiles-2.RData")



### Compute product of population and mean income for each Income interval
### Divided by total income
Sy.countries <- paste("Sy", countries, sep = ".")
IncomeShareByIncomeLevel <- function(data, cols) {
    for (col in cols) {
        name <- paste("Sy", col, sep = ".")
        data[, name] <- NA
        # convert integers to double to avoid integer overflow
        data[, name] <- as.double(data[, paste0("N.",col)]) * data[, paste0("Y.", col)] / tail(data[, col], n=1) 
    }
    return(data)
}
## apply function to data and selected variables
df <- IncomeShareByIncomeLevel(data = df, cols = countries)


### Compute product of population and mean income for each Income interval
### Divided by total number of households 
# weights <- list(Germany = 1, France = 1, Italy = 1, Spain = 1, UK = 1)
# all values for 2012
households <- list(Germany = 40115100, France = 27750400, Italy = 25336000, Spain = 17433700, UK = 27963800)
population <- list(Germany = 82031000, France = 63375000, Italy = 59394000, Spain = 46818000, UK = 63705000)
## number of person per household for each country
##  for (country in countries) print(population[[country]]/households[[country]])
##  [1] 2.044891
##  [1] 2.283751
##  [1] 2.344253
##  [1] 2.685488
##  [1] 2.278124
## Numbers in agreement with:  http://www.pordata.pt/en/Europe/Average+number+of+persons+per+household-1613
Syw.countries <- paste("Syw", countries, sep = ".")
for (country in countries) print(households[[country]]/population[[country]])
weights <- list(Germany = 0.4890237, France = 0.4378761, Italy = 0.4265751, Spain = 0.3723717, UK = 0.4389577)
IncomeShareByIncomeLevelWeighted <- function(data, cols, wgts) {
    for (col in cols) {
        name <- paste("Syw", col, sep = ".")
        data[, name] <- NA
        data[, name] <- as.double(data[, paste0("N.",col)]) * data[, paste0("Y.", col)] / tail(data[, col], n=1) * wgts[[col]]
    }
    return(data)
}
## apply function to data and selected variables
df <- IncomeShareByIncomeLevelWeighted(data = df, cols = countries, wgts = weights)

#save(df, file = "Data/annual-income-table1-quantiles-3.RData")
#load(file = "Data/annual-income-table1-quantiles-3.RData")


## Compute income share by quantile weighted by person-per-houshehold
Sqw.countries <- paste("Sqw", countries, sep = ".")
IncomeShareByQuantileWeighted <- function(data, cols, wgts) {
    for (col in cols) {
        name <- paste("Sqw", col, sep = ".")
        data[, name] <- NA
        data[, name] <- as.double(data[, paste0("N.",col)]) * data[, paste0("Y.", col)] / tail(data[, col], n=1) * wgts[[col]]
        data2 <- na.omit(data)
        data2 <- aggregate(data2[, name], 
                     by = list(data2[, paste0("q.",col)]), sum)
        names(data2) <- c("q", name)
    }
    return(data2)
}
## apply function to data and selected variables
df <- IncomeShareByQuantileWeighted(data = df, cols = countries, wgts = weights)




## Select data of interest
df <- df[c("Income", paste0("S.",countries), paste0("Sw.",countries), paste0("q.",countries))]
View(df)

## Reshape for plotting
library("reshape2")
df <- melt(df, id = c("Income", paste0("q.",countries)))
df <- na.omit(df)
str(df)


#save(df, file = "Data/annual-income-table1-quantiles.RData")


### Plot with ggplot
library("ggplot2")
library("scales") # comma_format()
load(file = "Data/annual-income-table1-quantiles.RData")
df <- subset(df, variable %in% c(paste0("S.",countries)))
ggplot(df, aes(x = Income, y = value, group = variable, colour = variable)) +
    geom_line(size = 1) +
    scale_colour_brewer(palette = 'Set1') +
    theme_bw() +
    xlab("percentile (%)") +
    ggtitle("Gross household income") +
    theme(plot.title = element_text(hjust = 0)) +
    theme(legend.position = 'right', legend.direction = 'vertical') +
    theme(legend.title = element_blank()) +
    theme(legend.key = element_blank())
## save PDF
ggsave(last_plot(), file = "gross-household-income-distribution.pdf", 
    width = 12, height = 7)

### Extract brewer colors for future use
library("RColorBrewer")
colorPalette <- brewer.pal(brewer.pal.info['Set1', 'maxcolors'], 'Set1')





## function to get numeric quantiles
qfun <- function(x, q = 5) {
    quantile <- cut(x, breaks = quantile(x, probs = 0:q/q), 
        include.lowest = TRUE, labels = 1:q)
    quantile
}



### Discarded pieces
## Find mid-point of each interval
##  makeMidpoint <- function(data, cols, prefix = "midvalue") {
##      for (col in cols) {
##          name <- paste(prefix, col, sep = ".")
##          brks <- seq(0, max(data[, col]), 100)
##          interval <- findInterval(data[, col], brks, all.inside = TRUE)
##          data[, name] <- (brks[interval] + brks[interval+1])/2  
##      }
##      return(data)
##  }
##  df <- makeMidpoint(data = df, cols = "Income", prefix = "mean")
