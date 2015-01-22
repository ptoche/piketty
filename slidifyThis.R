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

# Make all figures with slidify()
library(slidify)
slidify('figures.Rmd')

# Make individual chapter slides with slidify()
# Set directory
if(.Platform$OS.type == "windows"){
  setwd("c:/slidify/piketty/lectures/Chapter 01")
} else { 
  setwd("~/slidify/piketty/lectures/Chapter 01") 
}
library(slidify)
slidify('index.Rmd')



# View the html
# prepend: http://htmlpreview.github.com/?
http://htmlpreview.github.io/?https://github.com/ptoche/piketty/blob/master/index.html

http://htmlpreview.github.io/?https://github.com/ptoche/piketty/blob/master/lectures/Chapter%2006/index.html

[https://github.com/ptoche/piketty](http://htmlpreview.github.io/?https://github.com/ptoche/piketty/blob/master/index.html)


# mode selfcontained
# Default is standalone in which case all images are embedded in the html, and js/css assets are served from an online repository. Setting it to selfcontained links everything from your slide folder, so you should be able to copy your slide folder to another computer and present even when offline.