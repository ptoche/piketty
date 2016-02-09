### Reinhart-Rogoff Replication
## References:
## Carmen M. Reinhart and Kenneth S. Rogoff, "Growth in a Time of Debt", American Economic Review 100 (2010): 573–578
## Thomas Herndon, Michael Ash and Robert Pollin, "Does High Public Debt  Consistently Stifle Economic Growth? A Critique of Reinhart and Rogoff", Political Economy Research Institute, University of Massachusetts-Amherst,  Working Paper 322 (2013)

### Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/R/economics/Reinhart-Rogoff-Herndon-Ash-Pollin")
} else { 
  setwd("~/R/economics/Reinhart-Rogoff-Herndon-Ash-Pollin") 
}

### Load Packages
library("ggplot2")
library("scales")

df <- read.csv("debt.csv")
df <- df[, -1]
df$Decade <- factor(10 * df$Year %/% 10)
#df$Year <- as.Date(paste0(as.character(df$Year), "-01-01"), format = "%Y-%m-%d") # to work with dates instead of integers

ggplot(data = df, aes(x = Year, y = growth)) + 
  geom_line(color = "darkblue") +
  facet_wrap(~ Country) +
  xlab("\nRatio of public debt to GDP (%)") +
  ylab("Growth rate of real GDP (%)\n") + 
  scale_x_continuous(breaks = seq(1950, 2010, 20))

ggsave(last_plot(), file = "Reinhard-Rogoff-Debt.pdf", 
  width = 10, height = 10)
ggsave(last_plot(), file = "Reinhard-Rogoff-Debt.png", 
  width = 12, height = 8)




# fig. 2
qplot(data = debt, y = ratio, x = Year, geom = "line") + 
  facet_wrap(~ Country) +
  labs(x = NULL, y = ra)

# fig. 3
ggplot(data = debt, aes(y = growth, x = ratio)) + 
  geom_point(color = "grey50") +
  geom_smooth(method = "loess", size = 1, color = "black", se = FALSE) +
  scale_x_continuous(breaks = seq(0, 200, by = 100)) +
  facet_wrap(~ Decade, nrow = 1) +
  labs(y = gr, x = ra, title = "Corrected Reinhart and Rogoff data, 1946-2009\n") +
  theme_linedraw(12)

# uncomment to save last plot
# ggsave("reinhart-rogoff.png", width = 11, height = 8)

## have a nice day