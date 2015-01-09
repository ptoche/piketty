# Install packages:
library("devtools")
# install_github(c("slidify", "slidifyLibraries"), "ramnathv", ref = "dev")

# Load packages:
library("slidify")
library("slidifyLibraries")

# Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/slidify/piketty")
} else { 
  setwd("~/slidify/piketty") 
}

# Make main course page with slidify()
library(slidify)
slidify('index.Rmd')

# Make supplementary pages with slidify()
library(slidify)
slidify('start.Rmd')

# Make individual chapter slides with slidify()
# Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/slidify/piketty/lectures/Chapter 06")
} else { 
  setwd("~/slidify/piketty/lectures/Chapter 06") 
}
library(slidify)
slidify('index.Rmd')

# View the html
# prepend: http://htmlpreview.github.com/?
http://htmlpreview.github.io/?https://github.com/ptoche/piketty/blob/master/index.html

http://htmlpreview.github.io/?https://github.com/ptoche/piketty/blob/master/lectures/Chapter%2006/index.html

[https://github.com/ptoche/piketty](http://htmlpreview.github.io/?https://github.com/ptoche/piketty/blob/master/index.html)




# Make blog with blogify()
# not currently in use
# install_github('poirot', 'ramnathv')
# library(poirot)
# blogify(".")