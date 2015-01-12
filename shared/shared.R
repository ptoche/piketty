require(knitr)

# Set figure size and resolution
# figures in Piketty's Capital are approx 5 x 8.5
# ggplot2 figures are made to the same proportions
# knitr chunk: fig.height = 5, fig.width = 8.5
# image source: <img src="", width="680px", height="400px")
# rCharts have greater height
# r chunk: n$addParams(height = 500, width = 800)
# iframe css: width: 825px; height: 550px; 
# as above: h3 + iframe css, .rCharts, .nvd3
opts_chunk$set(fig.align = 'center', fig.height = 5, fig.width = 8.5, fig.retina = NULL, out.width = "800px", dpi = 300, pdf.options(encoding = "ISOLatin9.enc")) 
# list of encodings: list.files(system.file("enc", package = "grDevices")) 
# option __ out.width = "800px" __ causes error 
# 'You must not set both chunk options out.width and fig.retina'
# even though I did not set fig.retina
# workaround, set fig.retina to NULL

# evaluate fig.cap after a chunk is evaluated
opts_knit$set(eval.after = 'fig.cap')

# TeX styles in tex document, CSS styles in HTML document
opts_knit$set(self.contained = TRUE)

# modify the default hook to remove spaces before writing the output
hook_output = knit_hooks$get('output')
knit_hooks$set(output = function(x, options) {
  s = options$rm.spaces
  if (!is.null(s)) x = gsub(sprintf('(^|\n)%s', s), '\\1', x)
  hook_output(x, options)
})

# Rename figures to remove -1 suffix
local({# works for first element of dev=c('pdf','png')
  hook_plot = knit_hooks$get('plot')
  knit_hooks$set(plot = function(x, options) {
    name = sub('-1([.][a-z]{3,4})$', '\\1', x)
    if (name != x) file.rename(x, name)
    hook_plot(name, options)
  })
}) 

### Load R Packages to compile knitr chunks:
# setwd("~/R/capital21c/Github/Slides")# temp for convenience
library("ggplot2")      # wide range of plotting capabilities
library("scales")       # labels with %, $ and other units
library("RColorBrewer") # convenient color palettes

### Set ggplot theme for all plots
# change in font sizes may alter legend box positions and/or label overlaps
# White background, legend inside rectangular box, font size 13
# based on theme_bw() whose default values are:
# base_size = 12
# legend.key = theme_rect(colour = "grey80")
# legend.key.size = unit(1.2, "lines")
# legend.text = theme_text(size = base_size * 0.8)
# legend.title = theme_text(size = base_size * 0.8, face = "bold", hjust = 0)
# Remark: ggplot2 has a bug in legend.title vertical spacing when legend.title is NULL, e.g. , legend.title = element_text(vjust = 1)
# to do: add e.g. legend.justification = c(0,0)
theme_piketty <- function(x) {
  theme_bw(x) + 
      theme(legend.key = element_blank(), legend.background = element_rect(colour = 'black', fill = 'white'))
}
theme_set(theme_piketty(12))



### Set Line, Color & Shape Schemes
# 1. linetype scheme (not extensively tested)
linePalette <- c("solid", "dotted", "dashed", "dotdash", "longdash", "twodash", "13", "31", "1221")# "33" means 3 units on followed by 3 units off
# 2. shape scheme (is there a package for this?)
shapePalette <- c(17, 21, 15, 25, 19, 23, 18, 2, 16, 0, 8)
shapePalettePaired <- c(17, 2, 16, 21, 15, 0, 18, 23, 24)
  ## sp <- shapePalettePaired
  ## ggplot(data.frame(x = 1:length(sp) , y = 1:length(sp), z = sp), aes(x = x, y = y)) + geom_point(aes(shape = z), size = 10) + scale_shape_identity()
# 3. color scheme (with RBrewerColor package)
colorPalette <- colorRampPalette(brewer.pal(9, "Set1"))(9)# extract palette colors
# fill scheme (with RBrewerColor package)
fillPalette <- "Blues"  # shades of blue for filling areas of stack plots
shadePalette <- c("blue", "red", "green")  # light colors for shading areas
### Set a Black & White Scheme
# to set bw scheme, uncomment 4 lines below
    # colorPalette <- rep("#000000", 9)                 # black and white figures
    # fillPalette <- "Greys"                            # black and white figures
    # shadePalette <- c("grey50", "grey90", "grey95")   # grey color for shading
    # opts_chunk$set(fig.path = 'figures/bw/') # save in sub-directory


