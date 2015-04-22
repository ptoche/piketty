setwd("~/piketty/exercises/Inequality/")
library("xlsx")
df <- read.xlsx("Lorenz-Gini.xls", sheetName = "Barcelona", rowIndex = 2:23, colIndex = 1:2, header = FALSE, stringsAsFactors = FALSE)
names(df) <- df[1, ]
df <- df[-1, ]
row.names(df) <- NULL
save(df, file = "Lorenz-Gini.Rda")

load("Lorenz-Gini.Rda")

# install.packages("ineq")
library(ineq)

# Gini coefficient
ineq(df[, 2], type = "Gini")
## [1] 0.3452818

# Lorenz curve
plot(Lc(df[, 2]), col = "darkred", lwd = 2)

