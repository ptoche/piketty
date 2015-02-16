# Install packages:
library("devtools")
# install_github(c("slidify", "slidifyLibraries"), "ramnathv", ref = "dev")

# Load packages:
library("slidify")
library("slidifyLibraries")

# Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/piketty/slidify")
} else { 
  setwd("~/piketty/slidify") 
}

# Make main course page with slidify()
library(slidify)
slidify('index.Rmd')

# Make supplementary pages with slidify()
library(slidify)
slidify('start.Rmd')

# Make all figures with slidify()
library(slidify)
slidify('figures.Rmd')

# Make individual chapter slides with slidify()
setwd("~/piketty/slidify/lectures/Chapter 08") 
library(slidify)
slidify('index2.Rmd')

# Make Exercises slides index with slidify()
setwd("~/piketty/slidify/exercises") 
library(slidify)
slidify('index.Rmd')

# Make Tests slides index with slidify()
setwd("~/piketty/slidify/tests") 
library(slidify)
slidify('index.Rmd')

# Make test slides with slidify()
setwd("~/piketty/slidify/tests/02") 
library(slidify)
slidify('index.Rmd')



# mode selfcontained
# Default is standalone in which case all images are embedded in the html, and js/css assets are served from an online repository. Setting it to selfcontained links everything from your slide folder, so you should be able to copy your slide folder to another computer and present even when offline.