### Convenience functions
# returns string w/o leading whitespace
trim.leading <- function (x)  sub("^\\s+", "", x)
# returns string w/o trailing whitespace
trim.trailing <- function (x) sub("\\s+$", "", x)
# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

# Set directory, load data, transpose, clean 
setwd("~/piketty/knitr/slides/extra/NIPA/") 
library("xlsx")
df <- read.xlsx("Ita_T1.2.xls", sheetName = "Annual", rowIndex = 6:121, colIndex = 2:17, header = FALSE, stringsAsFactors = FALSE)
df <- t(df)
df.names <- c("Year", trim(df[1 ,-1]))  # trim white spaces
df <- df[-1, ]
df[df == "n.a."] <- NA
df <- as.data.frame(as.matrix(df))
names(df) <- df.names
row.names(df) <- NULL

# clean some names
names(df)[names(df) == "Balance on current account (line 1 less line 31) /5/"] <- "Balance on current account"
names(df)[names(df) == "Balance on goods and services (line 2 less line 32)"] <- "Balance on goods and services"
names(df)[names(df) == "Balance on goods (line 3 less line 33)"] <- "Balance on goods"
names(df)[names(df) == "Balance on services (line 13 less line 42)"] <- "Balance on services"
names(df)[names(df) == "Balance on primary income (line 23 less line 52)"] <- "Balance on primary income"
names(df)[names(df) == "Balance on secondary income (line 30 less line 58)"] <- "Balance on secondary income"
names(df)[names(df) == "Balance on capital account (line 59 less line 60) /5/"] <- "Balance on capital account"

# reshape and save data
library("reshape2")
df <- melt(df, id.vars = "Year")
df$value <- as.numeric(df$value)
df <- na.omit(df)
save(df, file = "df.Rda")


# Plots
# format axes
library("ggplot2")
library("scales")
dollarMillion <- function(x) {
  paste0("$", format(x, big.mark = ",", decimal.mark = ".", trim = TRUE, scientific = FALSE), "M")
}

# Plot 1: Current Account
# subset data
setwd("~/piketty/knitr/slides/extra/NIPA/")
load("df.Rda")
dfs <- subset(df, variable %in% c("Exports of goods and services and income receipts (credits)", "Imports of goods and services and income payments (debits)", "Balance on current account"))
dfs$value <- dfs$value/1000

ggplot(data = dfs, aes(x = Year, y = value, group = variable, colour = variable, shape = variable)) + geom_line() + geom_point(size = 3) + ylab("Current Account Transactions (Million $)") + xlab(NULL) +  theme_bw(14) + scale_x_discrete(breaks = seq(1999, 2013, by = 2)) + scale_y_continuous(labels = dollarMillion, limits = c(-1000, 4000), breaks = seq(-1000, 4000, by = 500)) + theme(legend.key = element_blank(), legend.background = element_rect(colour = 'black', fill = 'white'), legend.position = "top", legend.title = element_blank()) + guides(col = guide_legend(ncol = 1)) + geom_hline(yintercept = 0)



# variant of plot above: In Progress / LEGEND BUGGY
setwd("~/piketty/knitr/slides/extra/NIPA/")
load("df.Rda")
dollarBillion <- function(x) {
  paste0("$", format(x, big.mark = ",", decimal.mark = ".", trim = TRUE, scientific = FALSE), "B")
}
dfs1 <- subset(df, variable %in% c("Exports of goods and services and income receipts (credits)", "Imports of goods and services and income payments (debits)"), drop = TRUE)
dfs2 <- subset(df, variable %in% c("Balance on current account"))
dfs1$value <- dfs1$value/1000000 # change units to billions
dfs2$value <- dfs2$value/1000000 # change units to billions

library(RColorBrewer)
cols <- colorRampPalette(brewer.pal(9, "Set1"))(9)
ggplot(data = dfs1, aes(x = Year, y = value, group = variable, colour = variable, shape = variable)) + geom_line() + geom_point(size = 3) + geom_bar(data = dfs2, aes(x = Year, y = value), stat = "identity", colour = "darkred", fill = "darkred", alpha = 0.8) + ylab("Current Account Transactions (Million $)") + xlab(NULL) +  theme_bw(14) + scale_x_discrete(breaks = seq(1999, 2013, by = 2)) + scale_y_continuous(labels = dollarBillion, limits = c(-1, 4), breaks = seq(-1, 4, by = .5)) + geom_hline(yintercept = 0) + theme(legend.key = element_blank(), legend.background = element_rect(colour = 'black', fill = 'white'), legend.position = "top", legend.title = element_blank()) + guides(col = guide_legend(ncol = 1), fill = NULL, colour = NULL)



# save as pdf + png
ggsave(last_plot(), file = "Figure_Current_Account_Transactions.pdf", width = 8, height = 5, dpi = 300)
ggsave(last_plot(), file = "Figure_Current_Account_Transactions.png", width = 8, height = 5)


# Plot 2: Current Account Components
# subset data
load("df.Rda")
dfs <- subset(df, variable %in% c("Balance on current account", "Balance on goods and services", "Balance on goods", "Balance on services"))
dfs$value <- dfs$value/1000

ggplot(data = dfs, aes(x = Year, y = value, group = variable, colour = variable, shape = variable)) + geom_line() + geom_point(size = 3) + ylab("Current Account Components (Million $)") + xlab(NULL) +  theme_bw(14) + scale_x_discrete(breaks = seq(1999, 2013, by = 2)) + scale_y_continuous(labels = dollarMillion, limits = c(-1000, 300), breaks = seq(-1000, 500, by = 200)) + theme(legend.key = element_blank(), legend.background = element_rect(colour = 'black', fill = 'white'), legend.position = "top", legend.title = element_blank()) + guides(col = guide_legend(ncol = 2)) + geom_hline(yintercept = 0)

# save as pdf + png
ggsave(last_plot(), file = "Figure_Current_Account_Components.pdf", width = 8, height = 5, dpi = 300)
ggsave(last_plot(), file = "Figure_Current_Account_Components.png", width = 8, height = 5)



# Plot 3: Capital Account Components
# subset data
load("df.Rda")
dfs <- subset(df, variable %in% c("Balance on primary income", "Balance on secondary income", "Balance on capital account"))
dfs$value <- dfs$value/1000

ggplot(data = dfs, aes(x = Year, y = value, group = variable, colour = variable, shape = variable)) + geom_line() + geom_point(size = 3) + ylab("Current Account Components (Million $)") + xlab(NULL) +  theme_bw(14) + scale_x_discrete(breaks = seq(1999, 2013, by = 2)) + scale_y_continuous(labels = dollarMillion, limits = c(-200, 300), breaks = seq(-200, 500, by = 100)) + theme(legend.key = element_blank(), legend.background = element_rect(colour = 'black', fill = 'white'), legend.position = "top", legend.title = element_blank()) + guides(col = guide_legend(ncol = 2)) + geom_hline(yintercept = 0)


# save as pdf + png
ggsave(last_plot(), file = "Figure_Current_Account_Incomes.pdf", width = 8, height = 5, dpi = 300)
ggsave(last_plot(), file = "Figure_Current_Account_InIncomes.png", width = 8, height = 5)

