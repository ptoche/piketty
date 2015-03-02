### National Income Shares

### Data Source: Piketty, Capital in the Twenty-First Century,  2014.
setwd("~/piketty/knitr/Piketty2014FiguresTables")

library("xlsx")
library("reshape2")

### Income Shares: France
TS8.1 <- read.xlsx("Chapter8TablesFigures.xlsx",
  sheetName = "TS8.1", rowIndex = 6:116, colIndex = 1:6, header = FALSE)
names(TS8.1) <- c("Year", "france_top_10_is_wok", "france_top_1_is_wok", "france_top_01_is_wok", "france_top_10_ws", "france_top_1_ws")
## France
df_8_1Xa <- TS8.1[, c("Year", "france_top_01_is_wok")]
df_8_1Xa$Share <- "Top 0.1%"
df_8_1Xa$Category <- "Income Share"
df_8_1Xa$Detail <- "Excluding Capital Gains"
df_8_1Xa <- melt(df_8_1Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_1Xb <- TS8.1[, c("Year", "france_top_1_is_wok")]
df_8_1Xb$Share <- "Top 1%"
df_8_1Xb$Category <- "Income Share"
df_8_1Xb$Detail <- "Excluding Capital Gains"
df_8_1Xb <- melt(df_8_1Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_1Xc <- TS8.1[, c("Year", "france_top_10_is_wok")]
df_8_1Xc$Share <- "Top 10%"
df_8_1Xc$Category <- "Income Share"
df_8_1Xc$Detail <- "Excluding Capital Gains"
df_8_1Xc <- melt(df_8_1Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_1X <- rbind(df_8_1Xa, df_8_1Xb, df_8_1Xc)
df_8_1X$Country <- "France"
# complementary shares:
df_8_1Xaa <- df_8_1Xa
df_8_1Xaa$Share <- "Bottom 99.9%"
df_8_1Xaa$value <- 1-df_8_1Xa$value
df_8_1Xaa$variable <- "france_bot_999_is_wok"
df_8_1Xbb <- df_8_1Xb
df_8_1Xbb$Share <- "Bottom 99%"
df_8_1Xbb$value <- 1-df_8_1Xb$value
df_8_1Xbb$variable <- "france_bot_99_is_wok"
df_8_1Xcc <- df_8_1Xc
df_8_1Xcc$Share <- "Bottom 90%"
df_8_1Xcc$value <- 1-df_8_1Xc$value
df_8_1Xcc$variable <- "france_bot_90_is_wok"
df_8_1XX <- rbind(df_8_1Xaa, df_8_1Xbb, df_8_1Xcc)
df_8_1XX$Country <- "France"
# merge complementary shares:
df_8_1X <- rbind(df_8_1X, df_8_1XX)


### Income Shares: USA
TS8.2 <- read.xlsx("Chapter8TablesFigures.xlsx",
  sheetName = "TS8.2", rowIndex = 6:116, colIndex = 1:11, header = FALSE)
names(TS8.2) <- c("Year", "usa_top_10_is", "usa_top_10_5_is", "usa_top_5_1_is", "usa_top_1_is", "usa_top_01_is", "usa_top_10_is_wok", "usa_top_1_is_wok", "usa_top_01_is_wok", "usa_top_10_ws", "usa_top_1_ws")
## USA
df_8_2Xa <- TS8.2[, c("Year", "usa_top_01_is")]
df_8_2Xa$Share <- "Top 0.1%"
df_8_2Xa$Category <- "Income Share"
df_8_2Xa$Detail <- "Including Capital Gains"
df_8_2Xa <- melt(df_8_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xb <- TS8.2[, c("Year", "usa_top_1_is")]
df_8_2Xb$Share <- "Top 1%"
df_8_2Xb$Category <- "Income Share"
df_8_2Xb$Detail <- "Including Capital Gains"
df_8_2Xb <- melt(df_8_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xc <- TS8.2[, c("Year", "usa_top_10_is")]
df_8_2Xc$Share <- "Top 10%"
df_8_2Xc$Category <- "Income Share"
df_8_2Xc$Detail <- "Including Capital Gains"
df_8_2Xc <- melt(df_8_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xd <- TS8.2[, c("Year", "usa_top_01_is_wok")]
df_8_2Xd$Share <- "Top 0.1%"
df_8_2Xd$Category <- "Income Share"
df_8_2Xd$Detail <- "Excluding Capital Gains"
df_8_2Xd <- melt(df_8_2Xd, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xe <- TS8.2[, c("Year", "usa_top_1_is_wok")]
df_8_2Xe$Share <- "Top 1%"
df_8_2Xe$Category <- "Income Share"
df_8_2Xe$Detail <- "Excluding Capital Gains"
df_8_2Xe <- melt(df_8_2Xe, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2Xf <- TS8.2[, c("Year", "usa_top_10_is_wok")]
df_8_2Xf$Share <- "Top 10%"
df_8_2Xf$Category <- "Income Share"
df_8_2Xf$Detail <- "Excluding Capital Gains"
df_8_2Xf <- melt(df_8_2Xf, id.vars = c("Year", "Share", "Category", "Detail"))
df_8_2X <- rbind(df_8_2Xa, df_8_2Xb, df_8_2Xc, df_8_2Xd, df_8_2Xe, df_8_2Xf)
df_8_2X$Country <- "United States"
# complementary shares:
df_8_2Xaa <- df_8_2Xa
df_8_2Xaa$Share <- "Bottom 99.9%"
df_8_2Xaa$value <- 1-df_8_2Xa$value
df_8_2Xaa$variable <- "usa_bot_999_is"
df_8_2Xbb <- df_8_2Xb
df_8_2Xbb$Share <- "Bottom 99%"
df_8_2Xbb$value <- 1-df_8_2Xb$value
df_8_2Xbb$variable <- "usa_bot_99_is"
df_8_2Xcc <- df_8_2Xc
df_8_2Xcc$Share <- "Bottom 90%"
df_8_2Xcc$value <- 1-df_8_2Xc$value
df_8_2Xcc$variable <- "usa_bot_90_is"
df_8_2Xdd <- df_8_2Xd
df_8_2Xdd$Share <- "Bottom 99.9%"
df_8_2Xdd$value <- 1-df_8_2Xa$value
df_8_2Xdd$variable <- "usa_bot_999_is_wok"
df_8_2Xee <- df_8_2Xe
df_8_2Xee$Share <- "Bottom 99%"
df_8_2Xee$value <- 1-df_8_2Xb$value
df_8_2Xee$variable <- "usa_bot_99_is_wok"
df_8_2Xff <- df_8_2Xf
df_8_2Xff$Share <- "Bottom 90%"
df_8_2Xff$value <- 1-df_8_2Xc$value
df_8_2Xff$variable <- "usa_bot_90_is_wok"
df_8_2XX <- rbind(df_8_2Xaa, df_8_2Xbb, df_8_2Xcc, df_8_2Xdd, df_8_2Xee, df_8_2Xff)
df_8_2XX$Country <- "United States"
# merge complementary shares:
df_8_2X <- rbind(df_8_2X, df_8_2XX)


### Income Shares: UK, Germany, Sweden, Japan
TS9.2 <- read.xlsx("Chapter9TablesFigures.xlsx",
  sheetName = "TS9.2", rowIndex = 6:116, colIndex = 1:12, header = FALSE)
names(TS9.2) <- c("Year", "uk_top_10_is_wok","uk_top_1_is_wok", "uk_top_01_is_wok", "germany_top_10_is_wok", "germany_top_1_is_wok", "germany_top_01_is_wok", "sweden_top_10_is_wok", "sweden_top_1_is_wok", "sweden_top_01_is_wok", "japan_top_1_is_wok", "japan_top_01_is_wok")
## UK
df_9_2Xa <- TS9.2[, c("Year", "uk_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "uk_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xc <- TS9.2[, c("Year", "uk_top_10_is_wok")]
df_9_2Xc$Share <- "Top 10%"
df_9_2Xc$Category <- "Income Share"
df_9_2Xc$Detail <- "Excluding Capital Gains"
df_9_2Xc <- melt(df_9_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb, df_9_2Xc)
df_9_2X$Country <- "United Kingdom"
df_9_2X1 <- df_9_2X
# complementary shares:
df_9_2Xaa <- df_9_2Xa
df_9_2Xaa$Share <- "Bottom 99.9%"
df_9_2Xaa$value <- 1-df_9_2Xa$value
df_9_2Xaa$variable <- "uk_bot_999_is_wok"
df_9_2Xbb <- df_9_2Xb
df_9_2Xbb$Share <- "Bottom 99%"
df_9_2Xbb$value <- 1-df_9_2Xb$value
df_9_2Xbb$variable <- "uk_bot_99_is_wok"
df_9_2Xcc <- df_9_2Xc
df_9_2Xcc$Share <- "Bottom 90%"
df_9_2Xcc$value <- 1-df_9_2Xc$value
df_9_2Xcc$variable <- "uk_bot_90_is_wok"
df_9_2XX <- rbind(df_9_2Xaa, df_9_2Xbb, df_9_2Xcc)
df_9_2XX$Country <- "United Kingdom"
df_9_2XX1 <- df_9_2XX
# merge complementary shares:
df_9_2X1 <- rbind(df_9_2X1, df_9_2XX1)
## Germany
df_9_2Xa <- TS9.2[, c("Year", "germany_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "germany_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xc <- TS9.2[, c("Year", "germany_top_10_is_wok")]
df_9_2Xc$Share <- "Top 10%"
df_9_2Xc$Category <- "Income Share"
df_9_2Xc$Detail <- "Excluding Capital Gains"
df_9_2Xc <- melt(df_9_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb, df_9_2Xc)
df_9_2X$Country <- "Germany"
df_9_2X2 <- df_9_2X
# complementary shares:
df_9_2Xaa <- df_9_2Xa
df_9_2Xaa$Share <- "Bottom 99.9%"
df_9_2Xaa$value <- 1-df_9_2Xa$value
df_9_2Xaa$variable <- "germany_bot_999_is_wok"
df_9_2Xbb <- df_9_2Xb
df_9_2Xbb$Share <- "Bottom 99%"
df_9_2Xbb$value <- 1-df_9_2Xb$value
df_9_2Xbb$variable <- "germany_bot_99_is_wok"
df_9_2Xcc <- df_9_2Xc
df_9_2Xcc$Share <- "Bottom 90%"
df_9_2Xcc$value <- 1-df_9_2Xc$value
df_9_2Xcc$variable <- "germany_bot_90_is_wok"
df_9_2XX <- rbind(df_9_2Xaa, df_9_2Xbb, df_9_2Xcc)
df_9_2XX$Country <- "Germany"
df_9_2XX2 <- df_9_2XX
# merge complementary shares:
df_9_2X2 <- rbind(df_9_2X2, df_9_2XX2)
## Sweden
df_9_2Xa <- TS9.2[, c("Year", "sweden_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "sweden_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xc <- TS9.2[, c("Year", "sweden_top_10_is_wok")]
df_9_2Xc$Share <- "Top 10%"
df_9_2Xc$Category <- "Income Share"
df_9_2Xc$Detail <- "Excluding Capital Gains"
df_9_2Xc <- melt(df_9_2Xc, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb, df_9_2Xc)
df_9_2X$Country <- "Sweden"
df_9_2X3 <- df_9_2X
# complementary shares:
df_9_2Xaa <- df_9_2Xa
df_9_2Xaa$Share <- "Bottom 99.9%"
df_9_2Xaa$value <- 1-df_9_2Xa$value
df_9_2Xaa$variable <- "sweden_bot_999_is_wok"
df_9_2Xbb <- df_9_2Xb
df_9_2Xbb$Share <- "Bottom 99%"
df_9_2Xbb$value <- 1-df_9_2Xb$value
df_9_2Xbb$variable <- "sweden_bot_99_is_wok"
df_9_2Xcc <- df_9_2Xc
df_9_2Xcc$Share <- "Bottom 90%"
df_9_2Xcc$value <- 1-df_9_2Xc$value
df_9_2Xcc$variable <- "sweden_bot_90_is_wok"
df_9_2XX <- rbind(df_9_2Xaa, df_9_2Xbb, df_9_2Xcc)
df_9_2XX$Country <- "Sweden"
df_9_2XX3 <- df_9_2XX
df_9_2X3 <- rbind(df_9_2X3, df_9_2XX3)
# merge complementary shares:
df_9_2X3 <- rbind(df_9_2X3, df_9_2XX3)
## Japan
df_9_2Xa <- TS9.2[, c("Year", "japan_top_01_is_wok")]
df_9_2Xa$Share <- "Top 0.1%"
df_9_2Xa$Category <- "Income Share"
df_9_2Xa$Detail <- "Excluding Capital Gains"
df_9_2Xa <- melt(df_9_2Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2Xb <- TS9.2[, c("Year", "japan_top_1_is_wok")]
df_9_2Xb$Share <- "Top 1%"
df_9_2Xb$Category <- "Income Share"
df_9_2Xb$Detail <- "Excluding Capital Gains"
df_9_2Xb <- melt(df_9_2Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_2X <- rbind(df_9_2Xa, df_9_2Xb)
df_9_2X$Country <- "Japan"
df_9_2X4 <- df_9_2X
# complementary shares:
df_9_2Xaa <- df_9_2Xa
df_9_2Xaa$Share <- "Bottom 99.9%"
df_9_2Xaa$value <- 1-df_9_2Xa$value
df_9_2Xaa$variable <- "japan_bot_999_is_wok"
df_9_2Xbb <- df_9_2Xb
df_9_2Xbb$Share <- "Bottom 99%"
df_9_2Xbb$value <- 1-df_9_2Xb$value
df_9_2Xbb$variable <- "japan_bot_99_is_wok"
df_9_2XX <- rbind(df_9_2Xaa, df_9_2Xbb)
df_9_2XX$Country <- "Japan"
df_9_2XX4 <- df_9_2XX
# merge complementary shares:
df_9_2X4 <- rbind(df_9_2X4, df_9_2XX4)

## Merge dataframes
df_9_2X <- rbind(df_9_2X1, df_9_2X2, df_9_2X3, df_9_2X4)


## Income Shares: Canada, Australia, New Zealand, Denmark, Italy, Netherlands, Spain
TS9.3 <- read.xlsx("Chapter9TablesFigures.xlsx",
  sheetName = "TS9.3", rowIndex = 6:116, colIndex = 1:15, header = FALSE)
names(TS9.3) <- c("Year", "canada_top_1_is_wok", "canada_top_01_is_wok", "australia_top_1_is_wok","australia_top_01_is_wok", "nzl_top_1_is_wok", "nzl_top_01_is_wok", "denmark_top_1_is_wok","denmark_top_01_is_wok","italy_top_1_is_wok","italy_top_01_is_wok", "holland_top_1_is_wok","holland_top_01_is_wok","spa_top_1_is_wok","spa_top_01_is_wok")
## Canada
df_9_3Xa <- TS9.3[, c("Year", "canada_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "canada_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Canada"
df_9_3X1 <- df_9_3X
# complementary shares:
df_9_3Xaa <- df_9_3Xa
df_9_3Xaa$Share <- "Bottom 99.9%"
df_9_3Xaa$value <- 1-df_9_3Xa$value
df_9_3Xaa$variable <- "canada_bot_999_is_wok"
df_9_3Xbb <- df_9_3Xb
df_9_3Xbb$Share <- "Bottom 99%"
df_9_3Xbb$value <- 1-df_9_3Xb$value
df_9_3Xbb$variable <- "canada_bot_99_is_wok"
df_9_3XX <- rbind(df_9_3Xaa, df_9_3Xbb)
df_9_3XX$Country <- "Canada"
df_9_3XX1 <- df_9_3XX
# merge complementary shares:
df_9_3X1 <- rbind(df_9_3X1, df_9_3XX1)
## Australia
df_9_3Xa <- TS9.3[, c("Year", "australia_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "australia_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Australia"
df_9_3X2 <- df_9_3X
# complementary shares:
df_9_3Xaa <- df_9_3Xa
df_9_3Xaa$Share <- "Bottom 99.9%"
df_9_3Xaa$value <- 1-df_9_3Xa$value
df_9_3Xaa$variable <- "australia_bot_999_is_wok"
df_9_3Xbb <- df_9_3Xb
df_9_3Xbb$Share <- "Bottom 99%"
df_9_3Xbb$value <- 1-df_9_3Xb$value
df_9_3Xbb$variable <- "australia_bot_99_is_wok"
df_9_3XX <- rbind(df_9_3Xaa, df_9_3Xbb)
df_9_3XX$Country <- "Australia"
df_9_3XX2 <- df_9_3XX
# merge complementary shares:
df_9_3X2 <- rbind(df_9_3X2, df_9_3XX2)
## New Zealand
df_9_3Xa <- TS9.3[, c("Year", "nzl_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "nzl_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "New Zealand"
df_9_3X3 <- df_9_3X
# complementary shares:
df_9_3Xaa <- df_9_3Xa
df_9_3Xaa$Share <- "Bottom 99.9%"
df_9_3Xaa$value <- 1-df_9_3Xa$value
df_9_3Xaa$variable <- "nzl_bot_999_is_wok"
df_9_3Xbb <- df_9_3Xb
df_9_3Xbb$Share <- "Bottom 99%"
df_9_3Xbb$value <- 1-df_9_3Xb$value
df_9_3Xbb$variable <- "nzl_bot_99_is_wok"
df_9_3XX <- rbind(df_9_3Xaa, df_9_3Xbb)
df_9_3XX$Country <- "New Zealand"
df_9_3XX3 <- df_9_3XX
# merge complementary shares:
df_9_3X3 <- rbind(df_9_3X3, df_9_3XX3)
# Denmark
df_9_3Xa <- TS9.3[, c("Year", "denmark_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "denmark_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Denmark"
df_9_3X4 <- df_9_3X
# complementary shares:
df_9_3Xaa <- df_9_3Xa
df_9_3Xaa$Share <- "Bottom 99.9%"
df_9_3Xaa$value <- 1-df_9_3Xa$value
df_9_3Xaa$variable <- "nzl_bot_999_is_wok"
df_9_3Xbb <- df_9_3Xb
df_9_3Xbb$Share <- "Bottom 99%"
df_9_3Xbb$value <- 1-df_9_3Xb$value
df_9_3Xbb$variable <- "nzl_bot_99_is_wok"
df_9_3XX <- rbind(df_9_3Xaa, df_9_3Xbb)
df_9_3XX$Country <- "New Zealand"
df_9_3XX4 <- df_9_3XX
# merge complementary shares:
df_9_3X4 <- rbind(df_9_3X4, df_9_3XX4)
# Italy
df_9_3Xa <- TS9.3[, c("Year", "italy_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "italy_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Italy"
df_9_3X5 <- df_9_3X
# complementary shares:
df_9_3Xaa <- df_9_3Xa
df_9_3Xaa$Share <- "Bottom 99.9%"
df_9_3Xaa$value <- 1-df_9_3Xa$value
df_9_3Xaa$variable <- "italy_bot_999_is_wok"
df_9_3Xbb <- df_9_3Xb
df_9_3Xbb$Share <- "Bottom 99%"
df_9_3Xbb$value <- 1-df_9_3Xb$value
df_9_3Xbb$variable <- "italy_bot_99_is_wok"
df_9_3XX <- rbind(df_9_3Xaa, df_9_3Xbb)
df_9_3XX$Country <- "Italy"
df_9_3XX5 <- df_9_3XX
# merge complementary shares:
df_9_3X5 <- rbind(df_9_3X5, df_9_3XX5)
# Netherlands
df_9_3Xa <- TS9.3[, c("Year", "holland_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "holland_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Netherlands"
df_9_3X6 <- df_9_3X
# complementary shares:
df_9_3Xaa <- df_9_3Xa
df_9_3Xaa$Share <- "Bottom 99.9%"
df_9_3Xaa$value <- 1-df_9_3Xa$value
df_9_3Xaa$variable <- "holland_bot_999_is_wok"
df_9_3Xbb <- df_9_3Xb
df_9_3Xbb$Share <- "Bottom 99%"
df_9_3Xbb$value <- 1-df_9_3Xb$value
df_9_3Xbb$variable <- "holland_bot_99_is_wok"
df_9_3XX <- rbind(df_9_3Xaa, df_9_3Xbb)
df_9_3XX$Country <- "Netherlands"
df_9_3XX6 <- df_9_3XX
# merge complementary shares:
df_9_3X6 <- rbind(df_9_3X6, df_9_3XX6)
# Spain
df_9_3Xa <- TS9.3[, c("Year", "spa_top_01_is_wok")]
df_9_3Xa$Share <- "Top 0.1%"
df_9_3Xa$Category <- "Income Share"
df_9_3Xa$Detail <- "Excluding Capital Gains"
df_9_3Xa <- melt(df_9_3Xa, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3Xb <- TS9.3[, c("Year", "spa_top_1_is_wok")]
df_9_3Xb$Share <- "Top 1%"
df_9_3Xb$Category <- "Income Share"
df_9_3Xb$Detail <- "Excluding Capital Gains"
df_9_3Xb <- melt(df_9_3Xb, id.vars = c("Year", "Share", "Category", "Detail"))
df_9_3X <- rbind(df_9_3Xa, df_9_3Xb)
df_9_3X$Country <- "Spain"
df_9_3X7 <- df_9_3X
# complementary shares:
df_9_3Xaa <- df_9_3Xa
df_9_3Xaa$Share <- "Bottom 99.9%"
df_9_3Xaa$value <- 1-df_9_3Xa$value
df_9_3Xaa$variable <- "spain_bot_999_is_wok"
df_9_3Xbb <- df_9_3Xb
df_9_3Xbb$Share <- "Bottom 99%"
df_9_3Xbb$value <- 1-df_9_3Xb$value
df_9_3Xbb$variable <- "spain_bot_99_is_wok"
df_9_3XX <- rbind(df_9_3Xaa, df_9_3Xbb)
df_9_3XX$Country <- "Spain"
df_9_3XX7 <- df_9_3XX
# merge complementary shares:
df_9_3X7 <- rbind(df_9_3X7, df_9_3XX7)

## Merge all dataframes
df_9_3X <- rbind(df_9_3X1, df_9_3X2, df_9_3X3, df_9_3X4, df_9_3X5, df_9_3X6, df_9_3X7)


### Income Shares: All Countries
df_is <- rbind(df_8_1X, df_8_2X, df_9_2X, df_9_3X)
df_is$Name <- df_is$variable
df_is$variable <- paste0(df_is$Country, ": ", df_is$Share, " ", df_is$Category, " (", df_is$Detail, ")")
df_is$variable0 <- paste0(df_is$Country, ": ", df_is$Share, " ", df_is$Category)
df_is <- subset(df_is, select = c("Year", "Country", "Share", "Category", "Detail", "Name", "variable0", "variable", "value"))
df_is <- na.omit(df_is)
row.names(df_is) <- NULL

### Save dataframe
setwd("~/piketty/extra/Piketty-Zucman - 2014 - Income")
save(df_is, file = "data/df_is.Rda")


rm(list = ls()); gc();


### Aggregate National Income

### Data Source: Piketty & Zucman, Capital is Back,  2013.
setwd("~/piketty/knitr/PikettyZucman2013Data/")

library("xlsx")
library("reshape2")

df_AU <- read.xlsx("Australia.xls",
  sheetName = "Table AU.1", rowIndex = 9:60, colIndex = c(1,4), header = FALSE)
names(df_AU) <- c("Year", "Australia: National Income (2010 Billion Australian Dollars)")
df_AU$Country <- "Australia"
df_AU$Share <- "100%"
df_AU$Category <- "National Income"
df_AU$Detail <- "2010 Billion Australian Dollars"
df_AU <- melt(df_AU, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_CA <- read.xlsx("Canada.xls",
  sheetName = "Table CA.1", rowIndex = 9:60, colIndex = c(1,4), header = FALSE)
names(df_CA) <- c("Year", "Canada: National Income (2010 Billion Canadian Dollars)")
df_CA$Country <- "Canada"
df_CA$Share <- "100%"
df_CA$Category <- "National Income"
df_CA$Detail <- "2010 Billion Canadian Dollars"
df_CA <- melt(df_CA, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_FR <- read.xlsx("France.xls",
  sheetName = "Table FR.1", rowIndex = 9:199, colIndex = c(1,4), header = FALSE)
names(df_FR) <- c("Year", "France: National Income (2010 Billion Euros)")
df_FR$Country <- "France"
df_FR$Share <- "100%"
df_FR$Category <- "National Income"
df_FR$Detail <- "2010 Billion Euros"
df_FR <- melt(df_FR, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_DE <- read.xlsx("Germany.xls",
  sheetName = "TableDE1", rowIndex = 10:151, colIndex = c(1,4), header = FALSE)
names(df_DE) <- c("Year", "Germany: National Income (2010 Billion Euros)")
df_DE$Country <- "Germany"
df_DE$Share <- "100%"
df_DE$Category <- "National Income"
df_DE$Detail <- "2010 Billion Euros"
df_DE <- melt(df_DE, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_IT <- read.xlsx("Italy.xls",
  sheetName = "Table IT.1", rowIndex = 9:60, colIndex = c(1,4), header = FALSE)
names(df_IT) <- c("Year", "Italy: National Income (2010 Billion Euros)")
df_IT$Country <- "Italy"
df_IT$Share <- "100%"
df_IT$Category <- "National Income"
df_IT$Detail <- "2010 Billion Euros"
df_IT <- melt(df_IT, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_JP <- read.xlsx("Japan.xls",
  sheetName = "Table JP.1", rowIndex = 9:69, colIndex = c(1,4), header = FALSE)
names(df_JP) <- c("Year", "Japan: National Income (2010 Trillion Yens)")
df_JP$Country <- "Japan"
df_JP$Share <- "100%"
df_JP$Category <- "National Income"
df_JP$Detail <- "2010 Trillion Yens"
df_JP <- melt(df_JP, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_ES <- read.xlsx("Spain.xls",
  sheetName = "Table ES.1", rowIndex = 9:49, colIndex = c(1,4), header = FALSE)
names(df_ES) <- c("Year", "Spain: National Income (2010 Billion Euros)")
df_ES$Country <- "Spain"
df_ES$Share <- "100%"
df_ES$Category <- "National Income"
df_ES$Detail <- "2010 Billion Euros"
df_ES <- melt(df_ES, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_UK <- read.xlsx("UK.xls",
  sheetName = "TableUK1", rowIndex = 10:166, colIndex = c(1,4), header = FALSE,)
names(df_UK) <- c("Year", "United Kingdom: National Income (2010 Billion Pounds)")
df_UK$Year <- as.numeric(as.character(df_UK$Year)) # clean-up Year
df_UK$Country <- "United Kingdom"
df_UK$Share <- "100%"
df_UK$Category <- "National Income"
df_UK$Detail <- "2010 Billion Pounds"
df_UK <- melt(df_UK, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_US <- read.xlsx("USA.xlsx",
  sheetName = "TableUS1", rowIndex = 9:150, colIndex = c(1,4), header = FALSE)
names(df_US) <- c("Year", "United States: National Income (2010 Billion Dollars)")
df_US$Country <- "United States"
df_US$Share <- "100%"
df_US$Category <- "National Income"
df_US$Detail <- "2010 Billion Dollars"
df_US <- melt(df_US, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

## Aggregate National Income: All Countries
df_ni <- rbind(df_AU, df_CA, df_FR, df_DE, df_IT, df_JP, df_ES, df_UK, df_US)


### Save dataframe
setwd("~/piketty/extra/Piketty-Zucman - 2014 - Income")
save(df_ni, file = "data/df_ni.Rda")


rm(list = ls()); gc();


### National Income Per Capita

### Data Source: Piketty & Zucman, Capital is Back,  2013.
setwd("~/piketty/knitr/PikettyZucman2013Data/")

library("xlsx")
library("reshape2")

df_AU <- read.xlsx("Australia.xls",
  sheetName = "Table AU.1", rowIndex = 9:60, colIndex = c(1,10), header = FALSE)
names(df_AU) <- c("Year", "Australia: National Income Per Capita (2010 Billion Australian Dollars)")
df_AU$Country <- "Australia"
df_AU$Share <- "100%"
df_AU$Category <- "National Income Per Capita"
df_AU$Detail <- "2010 Billion Australian Dollars"
df_AU <- melt(df_AU, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_CA <- read.xlsx("Canada.xls",
  sheetName = "Table CA.1", rowIndex = 9:60, colIndex = c(1,10), header = FALSE)
names(df_CA) <- c("Year", "Canada: National Income Per Capita (2010 Billion Canadian Dollars)")
df_CA$Country <- "Canada"
df_CA$Share <- "100%"
df_CA$Category <- "National Income Per Capita"
df_CA$Detail <- "2010 Billion Canadian Dollars"
df_CA <- melt(df_CA, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_FR <- read.xlsx("France.xls",
  sheetName = "Table FR.1", rowIndex = 9:199, colIndex = c(1,10), header = FALSE)
names(df_FR) <- c("Year", "France: National Income Per Capita (2010 Billion Euros)")
df_FR$Country <- "France"
df_FR$Share <- "100%"
df_FR$Category <- "National Income Per Capita"
df_FR$Detail <- "2010 Billion Euros"
df_FR <- melt(df_FR, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_DE <- read.xlsx("Germany.xls",
  sheetName = "TableDE1", rowIndex = 10:151, colIndex = c(1,10), header = FALSE)
names(df_DE) <- c("Year", "Germany: National Income Per Capita (2010 Billion Euros)")
df_DE$Country <- "Germany"
df_DE$Share <- "100%"
df_DE$Category <- "National Income Per Capita"
df_DE$Detail <- "2010 Billion Euros"
df_DE <- melt(df_DE, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_IT <- read.xlsx("Italy.xls",
  sheetName = "Table IT.1", rowIndex = 9:60, colIndex = c(1,10), header = FALSE)
names(df_IT) <- c("Year", "Italy: National Income Per Capita (2010 Billion Euros)")
df_IT$Country <- "Italy"
df_IT$Share <- "100%"
df_IT$Category <- "National Income Per Capita"
df_IT$Detail <- "2010 Billion Euros"
df_IT <- melt(df_IT, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_JP <- read.xlsx("Japan.xls",
  sheetName = "Table JP.1", rowIndex = 9:69, colIndex = c(1,10), header = FALSE)
names(df_JP) <- c("Year", "Japan: National Income Per Capita (2010 Trillion Yens)")
df_JP$Country <- "Japan"
df_JP$Share <- "100%"
df_JP$Category <- "National Income Per Capita"
df_JP$Detail <- "2010 Trillion Yens"
df_JP <- melt(df_JP, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_ES <- read.xlsx("Spain.xls",
  sheetName = "Table ES.1", rowIndex = 9:49, colIndex = c(1,10), header = FALSE)
names(df_ES) <- c("Year", "Spain: National Income Per Capita (2010 Billion Euros)")
df_ES$Country <- "Spain"
df_ES$Share <- "100%"
df_ES$Category <- "National Income Per Capita"
df_ES$Detail <- "2010 Billion Euros"
df_ES <- melt(df_ES, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_UK <- read.xlsx("UK.xls",
  sheetName = "TableUK1", rowIndex = 10:166, colIndex = c(1,10), header = FALSE)
names(df_UK) <- c("Year", "United Kingdom: National Income Per Capita (2010 Billion Pounds)")
df_UK$Year <- as.numeric(as.character(df_UK$Year)) # clean-up Year
df_UK$Country <- "United Kingdom"
df_UK$Share <- "100%"
df_UK$Category <- "National Income Per Capita"
df_UK$Detail <- "2010 Billion Pounds"
df_UK <- melt(df_UK, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

df_US <- read.xlsx("USA.xlsx",
  sheetName = "TableUS1", rowIndex = 9:150, colIndex = c(1,10), header = FALSE)
names(df_US) <- c("Year", "United States: National Income Per Capita (2010 Billion Dollars)")
df_US$Country <- "United States"
df_US$Share <- "100%"
df_US$Category <- "National Income Per Capita"
df_US$Detail <- "2010 Billion Dollars"
df_US <- melt(df_US, id.vars = c("Year", "Country", "Share", "Category", "Detail"))

## National Income Per Capita: All Countries
df_ni_pc <- rbind(df_AU, df_CA, df_FR, df_DE, df_IT, df_JP, df_ES, df_UK, df_US)

### Save dataframe
setwd("~/piketty/extra/Piketty-Zucman - 2014 - Income")
save(df_ni_pc, file = "data/df_ni_pc.Rda")


rm(list = ls()); gc();


### National Income Per Capita Shares

### Data Source: Piketty & Zucman, Capital is Back,  2013.
   ## Debug: Subset and check
   ## df <- subset(df_is_pc, Country == "France")
   ## plot(df$Year, df$value)
setwd("~/piketty/extra/Piketty-Zucman - 2014 - Income")  # use saved dataframes
load("data/df_is.Rda")
df_is_pc <- df_is   # basis for new dataframe
rm(df_is)  # no longer needed 
load("data/df_ni_pc.Rda")
df_ni_pc <- subset(df_ni_pc, Year %in% intersect(df_is_pc$Year, df_ni_pc$Year) & Country %in% intersect(df_is_pc$Country, df_ni_pc$Country), drop = TRUE)
df_is_pc <- subset(df_is_pc, Year %in% intersect(df_is_pc$Year, df_ni_pc$Year) & Country %in% intersect(df_is_pc$Country, df_ni_pc$Country), drop = TRUE)
df_is_pc <- merge(df_is_pc, df_ni_pc[names(df_ni_pc) %in% c("Year", "Country", "value")], by = c("Year", "Country"), sort = FALSE)
rm(df_ni_pc)  # no longer needed 
df_is_pc$Name <- paste0(df_is_pc$Name, "_pc")  # rename 
df_is_pc$Category <- "Income Share Per Capita"
df_is_pc$variable <- paste0(df_is_pc$Country, ": ", df_is_pc$Share, " ", df_is_pc$Category, " (", df_is_pc$Detail, ")")  # long variable name
df_is_pc$variable0 <- paste0(df_is_pc$Country, ": ", df_is_pc$Share, " ", df_is_pc$Category)  # short variable name
df_is_pc$value <- df_is_pc$value.x * df_is_pc$value.y
df_is_pc$value.x <- NULL
df_is_pc$value.y <- NULL

### Save dataframe
setwd("~/piketty/extra/Piketty-Zucman - 2014 - Income")
save(df_is_pc, file = "data/df_is_pc.Rda")


rm(list = ls()); gc();

