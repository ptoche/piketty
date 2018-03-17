### Income Shares Per Capita

### Reference: Jones (2015), Figure 1
Jones_2015_Figure_1_caption <- "
Sources: Aggregate GDP per person data are taken from the Bureau of Economic Analysis (since 1929) and Angus Maddison (pre-1929). The top income share used to divide the GDP is from the October 2013 version of the World Top Incomes Database (Alvaredo, Atkinson, Piketty, and Saez n.d.).
Notes: This figure displays an estimate of average GDP per person for the top 0.1 percent and the bottom 99.9 percent. Average annual growth rates for the periods 1950–1980 and 1980–2007 are also reported.
"


### Data Source: Piketty & Zucman, Capital is Back,  2013.
setwd("~/piketty/extra/Piketty-Zucman - 2014 - Income")
load("data/df_is_pc.Rda")
df <- df_is_pc

# Clean: keep the short name variable0, discard the long name variable
df$variable <- df$variable0
df$variable0 <- NULL 

# Axis labels
dollarBillion <- function(x) {
  require(plyr)  # provides round_any() function
  x <- round_any(x/1000000, 0.01)
  paste0("$", format(x, big.mark = ",", decimal.mark = ".", trim = TRUE, scientific = FALSE), "B")
}
dollarMillion <- function(x) {
  require(plyr)  # provides round_any() function
  x <- round_any(x/1000, 0.01)
  paste0("$", format(x, big.mark = ",", decimal.mark = ".", trim = TRUE, scientific = FALSE), "M")
}

# Colors & Shapes
library(RColorBrewer) # convenient color palettes
linePalette <- c("solid", "dotted", "dashed", "dotdash", "longdash", "twodash", "13", "31", "1221")# "33" means 3 units on followed by 3 units off
shapePalette <- c(17, 21, 15, 25, 19, 23, 18, 2, 16, 0, 8)
shapePalettePaired <- c(17, 2, 16, 21, 15, 0, 18, 23, 24)
colorPalette <- colorRampPalette(brewer.pal(9, "Set1"))(9)
fillPalette <- "Blues"

# Load packages
library(ggplot2)
library(scales)

### WHAT IS THIS GRAPH AGAIN ??
# 1. Plots by Country / Top Shares
# Subset data
df <- subset(df_is_pc, Country %in% c("United States") & Name %in% c("Top 0.1%", "Top 1%", "Top 10%") & Detail %in% c("Excluding Capital Gains"))
# Plot
ggplot(data = df, aes(x = Year, y = value, group = variable, colour = variable, shape = variable)) + geom_line() + geom_point(size = 2) + ylab("Income Per Capita Shares of National Income \n(Million Dollars)") + xlab(NULL) + coord_trans(y = "log10") + scale_x_continuous(limits = c(1910, 2010), breaks = seq(1910, 2010, by = 10)) + scale_y_continuous(limits = c(1000*floor(min(df$value)/1000), 100000*ceiling(max(df$value)/100000)), breaks = 2^(0:7)*25000, labels = dollarMillion) + scale_shape_manual(name = "legend", values = shapePalette) + scale_colour_manual(name = "legend", values = colorPalette) + theme_bw(14) + theme(legend.key = element_blank(), legend.background = element_rect(colour = 'black', fill = 'white'), legend.position = c(.35, .85), legend.title = element_blank()) + guides(col = guide_legend(ncol = 1, reverse = TRUE), shape = guide_legend(ncol = 1, reverse = TRUE))
# Save PDF + PNG
setwd("~/piketty/extra/Jones - 2015")
ggsave(last_plot(), file = "figures/Figure_Income_Per_Capita_Shares_Top.png", width = 8, height = 5)
ggsave(last_plot(), file = "figures/Figure_Income_Per_Capita_Shares_Top.pdf", width = 8, height = 5)


# 2. Plots by Country / Top + Bottom Pair of Shares
# Subset data
df <- subset(df_is_pc, Country %in% c("United States") & Name %in% c("Top 0.1%", "Bottom 99.9%") & Detail %in% c("Including Capital Gains"))
# Plot
ggplot(data = df, aes(x = Year, y = value, group = variable, colour = variable, shape = variable)) + geom_line() + geom_point(size = 2) + ylab("Income Per Capita Shares of National Income \n(Million Dollars)") + xlab(NULL) + coord_trans(y = "log10") + scale_x_continuous(limits = c(1910, 2010), breaks = seq(1910, 2010, by = 10)) + scale_y_continuous(limits = c(1000*floor(min(df$value)/1000), 100000*ceiling(max(df$value)/100000)), breaks = 2^(0:11)*5000, labels = dollarMillion) + scale_shape_manual(name = "legend", values = shapePalette) + scale_colour_manual(name = "legend", values = colorPalette) + theme_bw(14) + theme(legend.key = element_blank(), legend.background = element_rect(colour = 'black', fill = 'white'), legend.position = "top", legend.title = element_blank()) + guides(col = guide_legend(ncol = 1, reverse = TRUE), shape = guide_legend(ncol = 1, reverse = TRUE))
# Save PDF + PNG
setwd("~/piketty/extra/Jones - 2015")
ggsave(last_plot(), file = "figures/Figure_Income_Per_Capita_Shares_Top01_Bottom999.png", width = 8, height = 5)
ggsave(last_plot(), file = "figures/Figure_Income_Per_Capita_Shares_Top01_Bottom999.pdf", width = 8, height = 5)

# annualized growth rates
1950-1980
df["Year" == 1950, ]$
1980-2007
