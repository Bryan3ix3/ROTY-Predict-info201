library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)

# reads historical data of ROTY's
historic_stats <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor/main/Data/ROTY%20Historic%20Stats.csv?token=ASMBEZNVIEQBG5HP2OKF6ETAHAEJE")

# making dataframe of every ROTY and their draft pick number
df <- historic_stats[, c("YEAR", "DP")]
head(df)

# takes all ROTY draft pick numbers and subtracts 1
# this is to find how far they were from the first pick
df$dp_diff <- df$DP - 1

# makes a table of the counts and converts into data frame
count_of_diff_years_from_0 <- as.data.frame(table(df$dp_diff))

# plots frame into bar chart
bar_chart <- ggplot(data = count_of_diff_years_from_0, aes(x = Var1,
  y = Freq, fill = Var1)) + geom_bar(stat = "identity") +
  ggtitle("ROTYs based on draft pick number") +
  xlab("Places from 1 (1st draft place)") + ylab("ROTYs") +
  theme(legend.position = "none") +
  theme(plot.title = element_text(hjust = 0.5))