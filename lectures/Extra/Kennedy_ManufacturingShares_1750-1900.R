Relative Shares Of World Manufacturing Output 1750-1900
                                                                                               
df <- data.frame(
    "Year" = c(1750, 1800, 1830, 1860, 1880, 1900),
    "Europe" = c(23.2, 28.1, 34.2, 53.2, 61.3, 62.0),
    "UK" = c(1.9, 4.3, 9.5, 19.9, 22.9, 18.5),
    "Habsburg" = c(2.9, 3.2, 3.2, 4.2, 4.4, 4.7),
    "France" = c(4.0, 4.2, 5.2, 7.9, 7.8, 6.8),
    "Germany" = c(2.9, 3.5, 3.5, 4.9, 8.5, 13.2),
    "Italy" = c(2.4, 2.5, 2.3, 2.5, 2.5, 2.5),
    "Russia" = c(5.0, 5.6, 5.6, 7.0, 7.6, 8.8),
    "US" = c(0.1, 0.8, 2.4, 7.2, 14.7, 23.6),
    "Japan" = c(3.8, 3.5, 2.8, 2.6, 2.4, 2.4),
    "ThirdWorld" = c(73.0, 67.7, 60.5, 36.6, 20.9, 11.0),
    "China" = c(32.8, 33.3, 29.8, 19.7, 12.5, 6.2),
    "India" = c(24.5, 19.7, 17.6, 8.6, 2.8, 1.7)
)
names(df) <- c("Year", "Europe", "United Kingdom", "Habsburg Empire", "France", "German States / Germany", "Italian States / Italy", "Russia", "United States", "Japan", "Third World", "China", "India / Pakistan")

library(reshape2)
df <- melt(df, id.vars = "Year")
library(ggplot2)
library(RColorBrewer)
dfs <- subset(df, variable %in% c("United Kingdom", "Habsburg Empire", "France", "German States / Germany", "Italian States / Italy", "Russia", "United States", "Japan", "China", "India / Pakistan"))
colourCount = length(selected)
getPalette = colorRampPalette(brewer.pal(9, "Blues"))

ggplot(data = dfs, aes(x = Year, y = value/100, group = variable, fill = variable)) + geom_area(position = 'stack', alpha = .75) +
  ylab("Relative Shares Of World Manufacturing Output") + xlab("") +
  scale_x_continuous(breaks = c(1750, 1800, 1830, 1860, 1880, 1900)) + 
  scale_y_continuous(limits = c(0, 1), labels = percent, breaks = seq(0, 1, by = .1)) + 
  scale_fill_manual(values = getPalette(colourCount)) + 
  theme(legend.position = "right") + 
  guides(shape = guide_legend(ncol = 1), fill = guide_legend(reverse = TRUE))

ggsave(last_plot(), file = "figures/Kennedy_ManufacturingShare.pdf", width = 8, height = 5)

