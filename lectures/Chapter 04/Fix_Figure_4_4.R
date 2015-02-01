Figure 4.4

library(ggplot2)
load("../../data/df_4_4.Rda") 
ggplot(data = df_4_4, aes(x = Year, y = value, group = interaction(variable,Category), colour = variable, shape = variable)) + geom_line() 

group <- interaction(df_4_4$variable,df_4_4$Category)



library(rCharts)
load("../../data/df_4_4.Rda") 
# create NaN data to 'break' interpolation between 1870 and 2010
df <- subset(df_4_4, Year %in% 1870)
df$Year <- 1869
df$value <- NA
df <- rbind(df_4_4, df)
row.names(df) <- NULL
n <- nPlot(data = df, value ~ Year, group = 'variable', type = 'lineChart') 
n$chart(defined = "#! function(d) {return !isNaN(d)} !#")
n


df <- subset(df_5_5, Year %in% 1970)
df$Year <- 1960
df$value <- NA
df <- rbind(df_5_5, df)

df2 <- subset(df_5_5, Year %in% 2010)
df2$Year <- 2020
df2$value <- NA
df <- rbind(df, df2)
row.names(df) <- NULL
n <- nPlot(data = df, value ~ Year, group = 'variable', type = 'lineChart') 
n



