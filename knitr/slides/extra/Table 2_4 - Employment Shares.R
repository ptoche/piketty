# Set directory to Piketty data
setwd("~/piketty/knitr/slides") 
library("xlsx") 
# select relevant data in employment-share sheet T2.4
df <- read.xlsx("../Piketty2014FiguresTables/Chapter2TablesFigures.xlsx",
  sheetName = "T2.4", rowIndex = 8:11, colIndex = 1:7, header = FALSE)
names(df) <- c("Year", "Agriculture", "Manufacturing", "Services", "Agriculture", "Manufacturing", "Services")  # name variable
df.fr <- df[, 1:4]  # split by country
Country <- c("France", "France", "France", "France")
df.fr <- cbind(df.fr, Country)
df.us <- df[, c(1,5:7)]  # split by country
Country <- c("United States", "United States", "United States", "United States")
df.us <- cbind(df.us, Country)
df <- rbind(df.us, df.fr)  # bind 2 countries together
library(reshape2)  # convert to long form
df <- melt(df, id.vars = c("Year", "Country"))
# convert % to numbers
df$value <- as.numeric(sub("%", "", df$value))

# discrepancy for USA 1950
sum(subset(df, Country == "United States" & Year == 1950)$value)
## [1] 0.97
# Data for 1900 et 1950: T. Piketty, "Les emplois de services de France et aux Etats-Unis", Note de la Fondation Saint-Simon, 1997, Tableau III, p.11 (all the details on the sources are avalaible pp.43-44; figures for the United States regard years 1900 and 1950, figures for France regard years 1906 et 1954)
# See: http://piketty.pse.ens.fr/fichiers/public/Piketty1997c.pdf

# Fix the typo
df[with(df, Country == "United States" & Year == 1950 & variable == "Services"),]$value <- 0.533
sum(subset(df, Country == "United States" & Year == 1950)$value)
## [1] 1

# Save data
setwd("~/piketty/knitr/slides/extra")
df_2_T4 <- df
save(df, file = "data/df_2_T4.Rda")

# Load data
setwd("~/piketty/knitr/slides/extra")
load("data/df_2_T4.Rda") 
df <- df_2_T4


# Make plot
library("ggplot2")
library("scales")

# Version 1
# Sally's version (with legend on the side)
p1 <- ggplot(data = subset(df, Country == "France"), aes(x = Year, y = value, group = variable, fill = variable)) + geom_area(position = 'stack', alpha = 0.5)  + theme_bw() + scale_fill_brewer(palette = "Blues") + scale_y_continuous(labels = percent) + theme(legend.position = "right") +  guides(fill = guide_legend(title = NULL, ncol = 1, reverse = TRUE)) + ylab('Sectoral employment share (% of total)') + xlab(NULL) + ggtitle("France")
p2 <- ggplot(data = subset(df, Country == "United States"), aes(x = Year, y = value, group = variable, fill = variable)) + geom_area(position = 'stack', alpha = 0.5)  + theme_bw() + scale_fill_brewer(palette = "Blues") + scale_y_continuous(labels = percent) + theme(legend.position = "right") +  guides(fill = guide_legend(title = NULL, ncol = 1, reverse = TRUE)) + ylab('Sectoral employment share (% of total)') + xlab(NULL) + ggtitle("United States")

# save as pdf, png
ggsave(p1, file = "figures/Figure_Table_2_4_France_Sally.pdf", width = 8, height = 5, dpi = 300)
ggsave(p1, file = "figures/Figure_Table_2_4_France_Sally.png", width = 8, height = 5)
ggsave(p2, file = "figures/Figure_Table_2_4_UnitedStates_Sally.pdf", width = 8, height = 5, dpi = 300)
ggsave(p2, file = "figures/Figure_Table_2_4_UnitedStates_Sally.png", width = 8, height = 5)

# Version 2
# Harry's version (with legend inside)
p1 <- ggplot(data = subset(df, Country == "France"), aes(x = Year, y = value, group = variable, fill = variable)) + geom_area(position = 'stack', alpha = 0.5, show_guide = FALSE)  + theme_bw() + scale_fill_brewer(palette = "Blues") + scale_y_continuous(labels = percent) + ylab('Sectoral employment share (% of total)') + xlab(NULL) + ggtitle("France") + geom_text(data = subset(df, Country == "France" & Year == head(df$Year, 1)), aes(x = 10+Year, y = cumsum(value)-.6*value, label = variable), vjust = 1, hjust = 0, size = 4)
p2 <- ggplot(data = subset(df, Country == "United States"), aes(x = Year, y = value, group = variable, fill = variable)) + geom_area(position = 'stack', alpha = 0.5, show_guide = FALSE)  + theme_bw() + scale_fill_brewer(palette = "Blues") + scale_y_continuous(labels = percent) + ylab('Sectoral employment share (% of total)') + xlab(NULL) + ggtitle("United States") + geom_text(data = subset(df, Country == "United States" & Year == head(df$Year, 1)), aes(x = 10+Year, y = cumsum(value)-.6*value, label = variable), vjust = 1, hjust = 0, size = 4)

# save as pdf, png
ggsave(p1, file = "figures/Figure_Table_2_4_France_Harry.pdf", width = 8, height = 5, dpi = 300)
ggsave(p1, file = "figures/Figure_Table_2_4_France_Harry.png", width = 8, height = 5)
ggsave(p2, file = "figures/Figure_Table_2_4_UnitedStates_Harry.pdf", width = 8, height = 5, dpi = 300)
ggsave(p2, file = "figures/Figure_Table_2_4_UnitedStates_Harry.png", width = 8, height = 5)


# Make a 2-figure layout
g1 <- ggplot_gtable(ggplot_build(p1))
g2 <- ggplot_gtable(ggplot_build(p2))
library(grid)
maxWidth <- unit.pmax(g1$widths[2:3], g2$widths[2:3])
g1$widths[2:3] <- maxWidth
g2$widths[2:3] <- maxWidth
library(gridExtra)
grid.arrange(g2, g1)

