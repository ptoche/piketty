setwd("~/piketty/knitr/slides/extra")
library(ggplot2)
library(scales)
library(RColorBrewer)

# Income Shares
load("data/df_is.Rda")
df1 <- subset(df_is, Country %in% c("United States") & Share %in% c("Top 0.1%", "Top 1%", "Top 10%") & Detail %in% c("Excluding Capital Gains"))

# National Income Per Capita
load("data/df_ni_pc.Rda")
df2 <- subset(df_ni_pc, Country %in% c("United States"))

df2 <- subset(df2, Year %in% intersect(df1$Year, df2$Year))
df1 <- subset(df1, Year %in% intersect(df1$Year, df2$Year))

# National Income Per Capita Shares
df <- merge(df1, df2[names(df2) %in% c("Year", "value")], by = "Year")
df$Name <- NULL  # no longer a valid name
df$Category <- "Income Share Per Capita"
df$variable <- paste0(df$Country, ": ", df$Share, " ", df$Category, " (", df$Detail, ")")  # long variable name
df$variable0 <- paste0(df$Country, ": ", df$Share, " ", df$Category)  # short variable name
df$variable <- NULL  # keep the short variable name variable0
names(df)[names(df) == "variable0"] <- "variable"
df$value <- df$value.x * df$value.y
df$value.x <- NULL
df$value.y <- NULL
View(df)



ggplot(data = df, aes(x = Year, y = value, group = variable, colour = variable, shape = variable)) + geom_line() + geom_point(size = 3) + ylab("National Income Per Capita Shares") + xlab(NULL) + scale_x_continuous(breaks = seq(1900, 2010, by = 10)) + scale_y_continuous(limits = c(0, .45), labels = percent, breaks = seq(0, .5, by = .1)) + scale_shape_manual(name = "France", values = shapePalette) + scale_colour_manual(name = "France", values = colorPalette) + theme(legend.position = c(.65, .85)) 

Jones (2015), Figure 1.
Sources: Aggregate GDP per person data are taken from the Bureau of Economic Analysis (since 1929) and Angus Maddison (pre-1929). The top income share used to divide the GDP is from the October 2013 version of the World Top Incomes Database (Alvaredo, Atkinson, Piketty, and Saez n.d.).
Notes: This figure displays an estimate of average GDP per person for the top 0.1 percent and the bottom 99.9 percent. Average annual growth rates for the periods 1950–1980 and 1980–2007 are also reported.

