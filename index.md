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

1. [Chapter 01 : Income and Output](lectures/Chapter 01/index.html)
2. [Chapter 02 : Growth: Illusions and Realities](lectures/Chapter 02/index.html)
3. [Chapter 03 : The Metamorphoses of Capital](lectures/Chapter 03/index.html)
4. [Chapter 04 : From Old Europe to the New World](lectures/Chapter 04/index.html)
5. [Chapter 05 : The Capital/Income Ratio Over the Long Run](lectures/Chapter 05/index.html)
6. [Chapter 06 : The Capital-Labor Split in the Twenty-First Century](lectures/Chapter 06/index.html)

---

### Reproduce
This website is based on the slidify framework (author: Ramnath Vaidyanathan). The source files are hosted on github and you may download the whole project as a zip file or fork it to a github repository in your account. To compile this website from the `.Rmd` source, configure the `site.yml` and run `blogify(".")` from the root of the folder hierarchy. Slidify will automatically detect all the `Rmd` files, slidify them, and create all lecture slides along with the index page. 

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
assets      -> put custom img/js/css/layout assets
lectures    -> folder containing lectures
  Chapter 01
  Chapter 02
  Chapter 03
libraries   -> frameworks, highlighters and widgets
index.Rmd   -> Rmd source for home page
site.yml    -> Site related configuration
```

