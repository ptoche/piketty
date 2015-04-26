setwd("~/piketty/exercises/Distribution/DistributionOfSalaries/")
library("xlsx")

# Barcelona
df <- read.xlsx("Soccer Salaries - Barcelona - Madrid.xls", 
    sheetName = "Barcelona", rowIndex = 2:23, colIndex = c(1,3), 
    header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Name", "Wages")
df <- df[-1, ]
row.names(df) <- NULL
df$Team <- "Barcelona"
df$Wages <- 52 * as.numeric(df$Wages)  # convert weekly to annual

save(df, file = "Barcelona.Rda")

# Madrid
df <- read.xlsx("Soccer Salaries - Barcelona - Madrid.xls", 
    sheetName = "Madrid", rowIndex = 2:25, colIndex = c(1,3), 
    header = FALSE, stringsAsFactors = FALSE)
names(df) <- c("Name", "Wages")
df <- df[-1, ]
row.names(df) <- NULL
df$Team <- "Madrid"
df$Wages <- 52 * as.numeric(df$Wages)  # convert weekly to annual

save(df, file = "Madrid.Rda")

load("Barcelona.Rda")
df1 <- df
load("Madrid.Rda")
df <- merge(df1, df, all = TRUE)
library(reshape2)
df <- melt(df, id.vars = c("Name", "Team"))

# Create Ordered Factors
df <- df[with(df, order(Team, variable, -value)), ]
row.names(df) <- NULL
df$Team <- as.factor(df$Team)
df$Name <-factor(df$Name, levels = df[order(df$value), "Name"], ordered = TRUE)

save(df, file = "df.Rda")

setwd("~/piketty/exercises/Distribution/")
load("df.Rda")

# Plots
library(ggplot2)

# Subset Madrid
df1 <- subset(df, Team == "Madrid")

# Increase colour range of palette 
library(RColorBrewer)
colourCount = length(unique(df1$Name))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))

# with currency/unit symbols
library(scales)
sterlingMillion <- function(x) {
  require(plyr)  # provides round_any() function
  x <- round_any(x/1000000, 0.01)
  paste0("£", format(x, big.mark = ",", decimal.mark = ".", trim = TRUE, scientific = FALSE), "M")
}

# plot horizontally, sorted, ascending, with currency/unit labels
df1 <- subset(df, Team == "Madrid")  # sorted data
ggplot(data = df1, aes(x = Name, y = value, fill = Name)) + 
  geom_bar(stat = "identity", fill = getPalette(colourCount)) + 
  theme_bw() + 
  xlab(NULL) + ylab(NULL) +
  scale_y_continuous(labels = sterlingMillion, 
    breaks = seq(0, max(df1$value), by = 1000000)) +
  scale_fill_brewer(palette = "Set1") +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Wages, 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip()

# save plot
ggsave(last_plot(), file = "bar-chart-horizontal-sorted-ascending-labels-Madrid.pdf", width = 10, height = 10)


# plot horizontally, sorted, ascending, without currency/unit labels
df1 <- subset(df, Team == "Madrid")  # sorted data
ggplot(data = df1, aes(x = Name, y = value/1000000, fill = Name)) + 
  geom_bar(stat = "identity", fill = getPalette(colourCount)) + 
  theme_bw() + 
  xlab(NULL) + ylab(NULL) +
  scale_y_continuous(breaks = seq(0, max(df1$value), by = 1)) +
  scale_fill_brewer(palette = "Set1") +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Wages, 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip()

# save plot
ggsave(last_plot(), file = "bar-chart-horizontal-sorted-ascending-Madrid.pdf", width = 10, height = 10)


# plot horizontally, sorted, descending
df1 <- subset(df, Team == "Madrid")  # sorted data
df1$Name <- factor(df1$Name, levels = df1$Name, ordered = TRUE)  # factor order
ggplot(data = df1, aes(x = Name, y = value/1000000, fill = Name)) + 
  geom_bar(stat = "identity", fill = getPalette(colourCount)) + 
  theme_bw() + 
  xlab(NULL) + ylab(NULL) +
  scale_y_continuous(breaks = seq(0, max(df1$value), by = 1)) +
  scale_fill_brewer(palette = "Set1") +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Wages, 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip()

# save plot
ggsave(last_plot(), file = "bar-chart-horizontal-sorted-descending-Madrid.pdf", width = 10, height = 10)


# plot horizontally, with unsorted data
df1 <- subset(df, Team == "Madrid")  # sorted data
df1 <- df1[sample(nrow(df1)),]  # un-sort the data
df1$Name <- factor(df1$Name, levels = df1$Name, ordered = TRUE)
ggplot(data = df1, aes(x = Name, y = value/1000000, fill = Name)) + 
  geom_bar(stat = "identity", fill = getPalette(colourCount)) + 
  theme_bw() + 
  xlab(NULL) + ylab(NULL) +
  scale_y_continuous(breaks = seq(0, max(df1$value), by = 1)) +
  scale_fill_brewer(palette = "Set1") +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Wages, 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  coord_flip()

# save plot
ggsave(last_plot(), file = "bar-chart-horizontal-unsorted-Madrid.pdf", width = 10, height = 10)


# Plot vertically, with unsorted data
library(grid)  # function unit()
ggplot(data = df1, aes(x = Name, y = value/1000000, fill = Name)) + 
  geom_bar(stat = "identity", fill = getPalette(colourCount)) + 
  theme_bw() + 
  xlab(NULL) + ylab(NULL) +
  scale_y_continuous(breaks = seq(0, max(df1$value), by = 1)) +
  scale_fill_brewer(palette = "Set1") +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Wages, 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        plot.margin = unit(c(1, 1, 1.5, 0.8), "lines"))  # c(top, right, bottom, left)

# save plot
ggsave(last_plot(), file = "bar-chart-vertical-unsorted-Madrid.pdf", width = 10, height = 10)

# Plot vertically, sorted, ordered, ascending
df1 <- subset(df, Team == "Madrid")  # sorted data
df1$Name <- factor(df1$Name, levels = df1$Name, ordered = TRUE)  # factor order
library(grid)  # function unit()
ggplot(data = df1, aes(x = Name, y = value/1000000, fill = Name)) + 
  geom_bar(stat = "identity", fill = getPalette(colourCount)) + 
  theme_bw() + 
  xlab(NULL) + ylab(NULL) +
  scale_y_continuous(breaks = seq(0, max(df1$value), by = 1)) +
  scale_fill_brewer(palette = "Set1") +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Wages, 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        plot.margin = unit(c(1, 1, 1.5, 0.8), "lines"))  # c(top, right, bottom, left)

# save plot
ggsave(last_plot(), file = "bar-chart-vertical-sorted-ascending-Madrid.pdf", width = 10, height = 10)


# Plot vertically, sorted, ordered, descending
df1 <- subset(df, Team == "Madrid")  # sorted data
df1 <- df1[with(df1, order(Team, variable, value)), ]  # reorder
df1$Name <- factor(df1$Name, levels = df1$Name, ordered = TRUE)  # factor order
library(grid)  # function unit()
ggplot(data = df1, aes(x = Name, y = value/1000000, fill = Name)) + 
  geom_bar(stat = "identity", fill = getPalette(colourCount)) + 
  theme_bw() + 
  xlab(NULL) + ylab(NULL) +
  scale_y_continuous(breaks = seq(0, max(df1$value), by = 1)) +
  scale_fill_brewer(palette = "Set1") +
  theme(panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank()) +
  ggtitle("Real Madrid Player Wages, 2014-2015 (million pounds sterling, £M)") + 
  theme(plot.title = element_text(hjust = 0)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        plot.margin = unit(c(1, 1, 1.5, 0.8), "lines"))  # c(top, right, bottom, left)

# save plot
ggsave(last_plot(), file = "bar-chart-vertical-sorted-descending-Madrid.pdf", width = 10, height = 10)
