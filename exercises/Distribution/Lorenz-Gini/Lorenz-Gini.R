### Plot a Lorenz curve

### Data
library("xlsx")
df <- read.xlsx("Lorenz-Gini.xls", sheetName = "Barcelona", rowIndex = 2:23, colIndex = 1:2, header = FALSE, stringsAsFactors = FALSE)
names(df) <- df[1, ]
df <- df[-1, ]
row.names(df) <- NULL
# save(df, file = "Lorenz-Gini.Rda")

### Set directory
if(.Platform$OS.type == "windows"){
  setwd("~/piketty/exercises/Distribution/Lorenz-Gini/")
} else { 
  setwd("~/piketty/exercises/Distribution/Lorenz-Gini/") 
}

load("Lorenz-Gini.Rda")

### Compute cumulative distribution data for Lorenz curve
# install.packages("ineq")
library("ineq") # function Lc(), ineq()

## Compute Gini coefficient
ineq(df[, 2], type = "Gini")
## [1] 0.3452818

## Compute Lorenz curve data
x <- Lc(df[, 2]) # weekly wage data
##  head(Lc(df[, 2]))
##  $p
##   [1] 0.00000000 0.04545455 0.09090909 0.13636364
##  
##  $L
##   [1] 0.0000000000 0.0000000000 0.0009965477
##  
##  $L.general
##   [1] 0.0000000000 0.0000000000 0.0003340492

### Lorenz curve in base-R 
pdf("Lorenz-Curve-1.pdf", width = 5, height = 5)
plot(x$p, x$L,
     col = "black",
     type = "b",
     lty = 1,
     lwd = 1,
     xlab = "Cumulative share of x",
     ylab = "Cumulative share of y",
     main = "Lorenz Curve")
abline(a = 0, b = 1)
dev.off()


### Lorenz curve with ggplot2
## Make a data.frame
#x <- Lc(x, n = rep(1, length(x)), plot = FALSE)
df <- data.frame(x[1], x[2])

## Plot: Basic Lorenz curve with ggplot2
library("ggplot2")
ggplot(data = df, aes(x = p, y = L)) +
    geom_point() +
    geom_segment(x = 0, y = 0, xend = 1, yend = 1, color = "darkblue") + 
    geom_line(color = "darkred") +
    theme_bw() +
    scale_x_continuous(limits = c(0,1)) + 
    scale_y_continuous(limits = c(0,1)) +
    xlab("Cumulative share of individuals \nranked from lowest to highest incomes") +
    ylab("Cumulative share of income earned")

ggsave(last_plot(), file = "Lorenz-Curve-2.pdf", 
    width = 5, height = 5)

## Plot: Lorenz curve with shaded areas
ggplot(data = df, aes(x = p, y = L)) +
    geom_point() +
    geom_segment(x = 0, y = 0, xend = 1, yend = 1, color = "darkblue") + 
    geom_line(color = "darkred") +
    theme_bw() +
    geom_ribbon(aes(ymin = p, ymax = L), fill = "red", alpha = 0.5) +
    geom_ribbon(aes(ymin = 0, ymax = L), fill = "blue", alpha = 0.5) +
    scale_x_continuous(limits = c(0,1)) + 
    scale_y_continuous(limits = c(0,1)) +
    xlab("Cumulative share of individuals \nranked from lowest to highest incomes") +
    ylab("Cumulative share of income earned")

ggsave(last_plot(), file = "Lorenz-Curve-3.pdf", 
    width = 5, height = 5)
