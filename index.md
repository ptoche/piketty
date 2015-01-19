---
title       : Piketty's Capital
subtitle    : Selected figures and tables
author      : Patrick Toche
framework   : bootstrap  # {minimal, bootstrap, io2012, html5slides, shower, dzslides, ...}
hitheme     : solarized_light  # {tomorrow, solarized_light...}
mode        : selfcontained  # {selfcontained, standalone, draft}
widgets     : []   # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/nvd3, libraries/morris, libraries/highcharts]}
---
[https://github.com/ptoche/piketty](http://htmlpreview.github.io/?https://github.com/ptoche/piketty/blob/master/index.html)

### Notes on Thomas Piketty's Capital





- This is a website to display material related to Thomas Piketty, Capital in the 21st Century (Harvard University Press, 2014), in particular data, tables and figures. 
- This project was started in January 2015 and is expected to be updated on a weekly basis until May 2015.

---

## Content

1. [Chapter 00 : Introduction](lectures/Chapter 00/index.html)
2. [Chapter 01 : Income and Output](lectures/Chapter 01/index.html)
3. [Chapter 02 : Growth: Illusions and Realities](lectures/Chapter 02/index.html)
4. [Chapter 03 : The Metamorphoses of Capital](lectures/Chapter 03/index.html)
5. [Chapter 04 : From Old Europe to the New World](lectures/Chapter 04/index.html)
6. [Chapter 05 : The Capital/Income Ratio Over the Long Run](lectures/Chapter 05/index.html)
7. [Chapter 06 : The Capital-Labor Split in the Twenty-First Century](lectures/Chapter 06/index.html)
8. [Chapter 07 : Inequality and Concentration: Preliminary Bearings](lectures/Chapter 07/index.html)
9. [Chapter 08 : Two Worlds](lectures/Chapter 08/index.html)
10. [Chapter 09 : Inequality of Labor Income](lectures/Chapter 09/index.html)
11. [Chapter 10 : Inequality of Capital Ownership](lectures/Chapter 10/index.html)
12. [Chapter 11 : Merit and Inheritance in the Long Run](lectures/Chapter 11/index.html)
13. [Chapter 12 : Global Inequality of Wealth in the Twenty-First Century](lectures/Chapter 12/index.html)
14. [Chapter 13 : A Social State for the Twenty-First Century](lectures/Chapter 13/index.html)

---

### Reproduce
This website is based on the slidify framework (author: Ramnath Vaidyanathan). The source files are hosted on github and you may download the whole project as a zip file or fork it to a github repository in your account. To compile this website from the `.Rmd` source, configure the `site.yml` and run `slidify('index.Rmd')`. 

You will need the `slidify`, `slidifyLibraries` and ``rCharts`, packages.

    install.packages("devtools")  
    devtools::install_github(c("slidify", "slidifyLibraries", "rCharts"), 
        "ramnathv", ref = "dev")  

In addition, I often use the following packages: ``ggplot2``, ``scales``, ``reshape2``, ``plyr```(author: Hadley Wickham). I am also using packages ``grid```and ``png```to insert images and control their size. Make sure these packages are installed in your ``R```system, e.g. run this for each package:

    install.packages("ggplot2")

Write a short slide deck and publish it to [Github](http://www.github.com) with a few clicks using [RStudio](http://www.rstudio.com), with a single line of code.

<p><a class="btn" href="start.html">Learn More &raquo;</a></p>


### Layout

The `lectures` folder holds the lecture slides, one subfolder per lecture. The site's architecture looks like this:

```
assets      -> custom img/js/css/layout assets
data        -> Piketty's data used for the tables and figures
figures     -> png figures built with ``ggplot2```library
lectures    -> folder containing lectures
  Chapter 01
  Chapter 02
  Chapter 03
libraries   -> frameworks, highlighters and widgets
shared      -> custom setup across all lectures, e.g. ``knitr```chunks
index.Rmd   -> Rmd source for home page
site.yml    -> Site related configuration
```

