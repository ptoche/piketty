### Directory
if(.Platform$OS.type == "windows"){
  setwd("c:/piketty/exercises/Distribution/DistributionOfSalaries/")
} else { 
  setwd("~/piketty/exercises/Distribution/DistributionOfSalaries/") 
}

### Prepare Data
## Barcelona 2014-2015
library("xlsx")
df <- read.xlsx("Distribution-2014-2015.xls", 
    sheetName = "Barcelona", rowIndex = 2:23, colIndex = c(1,3), 
    header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Name", "Wages")
df <- df[-1, ]
row.names(df) <- NULL
df$Team <- "Barcelona"
df$Wages <- 52 * as.numeric(df$Wages)  # convert weekly to annual

## Save Data
save(df, file = "Barcelona.Rda")
rm(df)

## Madrid 2014-2015
df <- read.xlsx("Distribution-2014-2015.xls", 
    sheetName = "Madrid", rowIndex = 2:25, colIndex = c(1,3), 
    header = FALSE, stringsAsFactors = FALSE)
## Madrid 2015-2016
#"Distribution-2014-2015.xls"
names(df) <- c("Name", "Wages")
df <- df[-1, ]
row.names(df) <- NULL
df$Team <- "Madrid"
df$Wages <- 52 * as.numeric(df$Wages)  # convert weekly to annual

## Save Data
save(df, file = "Madrid.Rda")

## Reshape Data
load("Barcelona.Rda")
df1 <- df
load("Madrid.Rda")
df <- rbind(df1, df)
library(reshape2)
df <- melt(df, id.vars = c("Name", "Team"))

## Create Ordered Factors
df <- df[with(df, order(Team, variable, -value)), ]
row.names(df) <- NULL
df$Team <- as.factor(df$Team)
df$Name <-factor(df$Name, levels = df[order(df$value), "Name"], ordered = TRUE)

## Save Data
save(df, file = "Teams.Rda")
load("Teams.Rda")

## Add currency/unit symbols
library(scales)
library(grid)  # function unit()
sterlingMillion <- function(x) {
  require(plyr)  # provides round_any() function
  x <- round_any(x/1000000, 0.01)
  paste0("£", format(x, big.mark = ",", decimal.mark = ".", trim = TRUE, scientific = FALSE), "M")
}

### Experiments
## subset Madrid and draw various bar charts
df1 <- subset(df, Team == "Madrid")  # Subset Madrid
library(ggplot2)



## 1. Poor barchart
ggplot(data = df1, aes(x = as.character(Name), y = value)) + 
  geom_bar(stat = "identity", fill = "black", width = 1) +
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = function(x){format(x, scientific = FALSE)}, 
      breaks = seq(0, max(df1$value), by = 1000000)) + 
  annotate(geom = "text", x = 12, y = 0.8*max(df$value),
    label = "A bar chart with many problems: \nThe data are not ordered by income levels \nThere are no y-axis labels describing the variable \nThere is no indication of the unit used \nThe big numbers are difficult to read \nThe labels on the x-axis overlap and are illegible \nThere are too many horizontal grid lines \nThe bars are too thick and the chart too dark",
    hjust = 0)

## Save plot
ggsave(last_plot(), file = "barchart-vertical-unsorted-unformatted.pdf", 
    width = 12, height = 8)



## 2. Improved barchart: vertical, ordered, descending, 
## with currency/units, slanted labels, and title
# re-order the Name factor before plotting
ggplot(data = df1, aes(x = reorder(Name, -value), y = value)) + 
  geom_bar(stat = "identity", color = "black", fill = "white", width = 0.8) + 
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 2000000)) +
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank()) +
  ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        plot.margin = unit(c(1, 1, 1.5, 0.8), "lines"))  # c(top, right, bottom, left)

# save plot
ggsave(last_plot(), file = "barchart-vertical-descending.pdf", 
    width = 12, height = 8)



## 3. Improved barchart: vertical, ordered, ascending, 
## with currency/units, slanted labels, and title
# re-order the Name factor before plotting
ggplot(data = df1, aes(x = reorder(Name, value), y = value)) + 
  geom_bar(stat = "identity", color = "black", fill = "white", width = 0.8) + 
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 2000000)) +
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank()) +
  ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        plot.margin = unit(c(1, 1, 1.5, 0.8), "lines"))  # c(top, right, bottom, left)

# save plot
ggsave(last_plot(), file = "barchart-vertical-ascending.pdf", 
    width = 12, height = 8)



## 4. Improved barchart: horizontal, ordered, descending 
## with currency/units and title
# re-order the Name factor before plotting
ggplot(data = df1, aes(x = reorder(Name, -value), y = value)) + 
  geom_bar(stat = "identity", color = "black", fill = "white", width = 0.8) + 
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 2000000)) +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip()

# save plot
ggsave(last_plot(), file = "barchart-horizontal-descending.pdf", 
    width = 12, height = 8)



## 5. Improved barchart: horizontal, ordered, ascending 
## with currency/units and title
# re-order the Name factor before plotting
ggplot(data = df1, aes(x = reorder(Name, value), y = value)) + 
  geom_bar(stat = "identity", color = "black", fill = "white", width = 0.8) + 
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 2000000)) +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip()

# save plot
ggsave(last_plot(), file = "barchart-horizontal-ascending.pdf", 
    width = 12, height = 8)



## 6. Poor colored barchart: horizontal, ordered, ascending 
## with currency/units, title, and default colors
## Increase colour range of palette 
ggplot(data = df1, aes(x = reorder(Name, value), y = value, fill = Name)) + 
  geom_bar(stat = "identity", width = 0.8) + 
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 2000000)) +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip() +
  annotate(geom = "text", x = 8, y = 0.4*max(df$value),
    label = "A colored bar chart with problems: \nThe legend repeats information already available \nWhile the colors may be pretty, they carry no information",
    hjust = 0)

# save plot
ggsave(last_plot(), file = "barchart-horizontal-ascending-colors.pdf", 
    width = 12, height = 8)



## 7. Poor colored barchart: horizontal, ordered, ascending 
## with currency/units, title, and unique colors
## Increase colour range of palette 
colourCount <- length(unique(df1$Name))
getPalette <- colorRampPalette(brewer.pal(9, "Set1"))
fill <- getPalette(colourCount)
ggplot(data = df1, aes(x = reorder(Name, value), y = value)) + 
    geom_bar(stat = "identity", width = 0.8, fill = fill) + 
    theme_bw() + 
    xlab(NULL) + 
    ylab(NULL) +
    scale_y_continuous(labels = sterlingMillion, 
                       breaks = seq(0, max(df1$value), by = 2000000)) +
    theme(panel.grid.major.y = element_blank(), 
          panel.grid.minor.y = element_blank()) +
    ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
    theme(plot.title = element_text(hjust = 0)) +
    coord_flip() +
    annotate(geom = "text", x = 8, y = 0.4*max(df$value),
             label = "A colored bar chart with problems: \nThe colors do not carry information",
             hjust = 0)

# save plot
ggsave(last_plot(), file = "barchart-horizontal-ascending-set1.pdf", 
    width = 12, height = 8)


## 8. Colored barchart: horizontal, ordered, ascending 
## with currency/units, title, and blues colors
## Increase colour range of palette 
library(RColorBrewer)
colourCount <- length(unique(df1$Name))
getPalette <- colorRampPalette(brewer.pal(9, "Blues"))
fill <- getPalette(colourCount)
ggplot(data = df1, aes(x = reorder(Name, value), y = value)) + 
  geom_bar(stat = "identity", width = 0.8, fill = fill) + 
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 2000000)) +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip() +
    annotate(geom = "text", x = 8, y = 0.4*max(df$value),
             label = "The intensity of the colors is not related to the level of income \nThe color gradient takes equal steps as it moves across players",
             hjust = 0)

# save plot
ggsave(last_plot(), file = "barchart-horizontal-ascending-blues.pdf", 
    width = 12, height = 8)



## 9. Colored barchart: horizontal, ordered, ascending 
## with currency/units, title, and blues colors
## Make a brewer function to deal with continuous range of colors
library(RColorBrewer)
library(RColorBrewer)
ggplot(data = df1, aes(x = reorder(Name, value), y = value, fill = value)) + 
    geom_bar(stat = "identity", width = 0.8) + 
    scale_fill_gradient(low = "lightblue", high = "darkblue", 
                        labels = sterlingMillion) +  # format legend values here
    theme_bw() + 
    xlab(NULL) + 
    ylab(NULL) +
    scale_y_continuous(labels = sterlingMillion, 
                       breaks = seq(0, max(df1$value), by = 2000000)) +
    theme(panel.grid.major.y = element_blank(), 
          panel.grid.minor.y = element_blank()) +
    ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
    theme(plot.title = element_text(hjust = 0)) +
    coord_flip() +
    annotate(geom = "text", x = 8, y = 0.4*max(df$value),
             label = "The intensity of the colors is proportional to the level of income \nThe legend is redundant and can be omitted",
             hjust = 0)

# save plot
ggsave(last_plot(), file = "barchart-horizontal-ascending-gradient-blues.pdf", 
    width = 12, height = 8)

## 10. Colored barchart: horizontal, ordered, ascending 
## with currency/units, title, and blues colors
## Make a brewer function to deal with continuous range of colors
ggplot(data = df1, aes(x = reorder(Name, value), y = value, fill = value)) + 
  geom_bar(stat = "identity", width = 0.8) + 
  scale_fill_gradient(low = "white", high = "darkred") +  
  theme_bw() + 
  xlab(NULL) + 
  ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 2000000)) +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Annual Wages, Season 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip() +
  theme(legend.position = 'none')  # workaround to bug
  # show.legend bug: not working in v.2.0.0

# save plot
ggsave(last_plot(), file = "barchart-horizontal-ascending-gradient-reds.pdf", 
    width = 12, height = 8)
