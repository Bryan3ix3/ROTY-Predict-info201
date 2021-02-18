library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)
library(reshape2)

# reads historical data of ROTY's
historic_stats <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor/main/Data/ROTY%20Historic%20Stats.csv?token=ASMBEZPX6V65RW3JY3YHSHTAGDJ3C")

# making dataframe of important stats
df <- historic_stats[, c("YEAR", "PPG", "AST", "REB")]
head(df)

# melting data so it can be graphed
df_melt <- reshape2::melt(df, id.var = "YEAR")

# line graph
ggplot(df_melt, aes(x = YEAR, y = value, colour = variable)) +
  geom_line(size = 1) + xlab("Year") + ylab("Points") + labs(color = "Stats") +
  ggtitle("Historic ROTY stats") +
  theme(plot.title = element_text(hjust = 0.5))
