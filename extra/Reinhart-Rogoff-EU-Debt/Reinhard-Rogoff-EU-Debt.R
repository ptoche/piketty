### http://wiekvoet.blogspot.com/2015/06/european-debt-and-interest.html

### Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/R/economics/Reinhart-Rogoff-EU-Debt")
} else { 
  setwd("~/R/economics/Reinhart-Rogoff-EU-Debt") 
}

### Load Packages
library("eurostat")
library("dplyr")
library("ggplot2")
library("scales")

### Government deficit/surplus, debt and associated data
df <- get_eurostat('gov_10dd_edpt1')

### Save Data
## saveRDS(df, file = "gov_10dd_edpt1.rds")

### Load Data
df <- readRDS("gov_10dd_edpt1.rds") # local copy

### add country names
df <- get_eurostat_dic('geo') %>%
    mutate(.,
        geo = V1,
        country = V2,
        country = gsub('\\(.*$','',country)) %>%
    select(.,geo,country) %>%
    merge(.,df) %>%
### filter countries
    filter(.,
        !grepl('EA.*',geo),
        !grepl('EU.*',geo),
        geo!='NO')

### Plot Lending/Borrowing
filter(df,
        sector == "S13", # general government
        na_item == "B9", # Net lending (+) /net borrowing (-)
        unit == "PC_GDP" # % GDP
    ) %>%
    ggplot(., aes(x = time, y = values)) + 
    geom_line(color = "darkblue") +
    facet_wrap(~country, nrow = 4) +
    xlab("Year") +
    ylab("Lending/Borrowing as percentage of GDP (%)") +
    ggtitle("Net lending (+) /net borrowing (-)") +
    geom_hline(yintercept = -3, colour = "black") +
    scale_x_date(breaks = seq(as.Date("1995-01-01"), as.Date("2015-01-01"), 
          by = "5 year"), labels = date_format("%Y"))

ggsave(last_plot(), file = "Reinhard-Rogoff-EU-Lending-Borrowing.pdf", 
  width = 10, height = 10)
ggsave(last_plot(), file = "Reinhard-Rogoff-EU-Lending-Borrowing.png", 
  width = 12, height = 8)

### Plot Debt
filter(df,
        sector == "S13", # general government
        na_item == "GD", # Gross debt
        unit == "PC_GDP" # % GDP
    ) %>%
    ggplot(., aes(x = time, y = values)) + 
    geom_line(color = "darkblue") +
    facet_wrap(~country, nrow = 4) +
    xlab("Year") +
    ylab("Debt as percentage of GDP (%)") +
    ggtitle("Gross debt") +
    geom_hline(yintercept = 60, colour = "black") +
    scale_x_date(breaks = seq(as.Date("1995-01-01"), as.Date("2015-01-01"), 
          by = "5 year"), labels = date_format("%Y"))

ggsave(last_plot(), file = "Reinhard-Rogoff-EU-Debt.pdf", 
  width = 10, height = 10)
ggsave(last_plot(), file = "Reinhard-Rogoff-EU-Debt.png", 
  width = 12, height = 8)

### Plot Interest Payments
filter(df,
        sector == "S13", # general government
        na_item == "D41PAY", # Interest, payable
        unit == "PC_GDP" # % GDP
    ) %>%
    ggplot(., aes(x = time, y = values)) +
    geom_line(color = "darkblue") +
    facet_wrap(~country, nrow = 4) +
    xlab("Year") +
    ylab("Interest as percentage of GDP (%)") +
    ggtitle("Interest, payable")
    geom_hline(yintercept = 60, colour = "black") +
    scale_x_date(breaks = seq(as.Date("1995-01-01"), as.Date("2015-01-01"), 
          by = "5 year"), labels = date_format("%Y"))

ggsave(last_plot(), file = "Reinhard-Rogoff-EU-Debt-Interest.pdf", 
  width = 10, height = 10)
ggsave(last_plot(), file = "Reinhard-Rogoff-EU-Debt-Interest.png", 
  width = 12, height = 8)

