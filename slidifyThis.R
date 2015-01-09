# Debug section
setwd("~/slidify/piketty/lectures/Chapter 06")# temp for convenience
require("ggplot2")
require("scales")
require("rCharts")

# Load Package:
library("devtools")
install_github(c("slidify", "slidifyLibraries"), "ramnathv", ref = "dev")
install_github('poirot', 'ramnathv')
library("poirot")

library("slidify")
library("slidifyLibraries")
library("poirot")

# Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/slidify/piketty")
} else { 
  setwd("~/slidify/piketty") 
}

# Make course webpage with blogify()
blogify(".")

# Make individual slides with slidify()
# Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/slidify/piketty/lectures/Chapter 06")
} else { 
  setwd("~/slidify/piketty/lectures/Chapter 06") 
}
library(slidify)
slidify('index.Rmd')


