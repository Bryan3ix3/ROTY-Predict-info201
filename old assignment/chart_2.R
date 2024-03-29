library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)
library(reshape2)

# reads historical data of ROTY's
historic_stats <- read.csv("data/ROTY Historic Stats.csv")

# making dataframe of important stats
df <- historic_stats[, c("YEAR", "PPG", "AST", "REB")]
head(df)

# melting data so it can be graphed
df_melt <- reshape2::melt(df, id.var = "YEAR")

# line graph
line_chart <- ggplot(df_melt, aes(x = YEAR, y = value, colour = variable)) +
  geom_line(size = 1) + xlab("Year") + ylab("Points") + labs(color = "Stats") +
  ggtitle("Historic ROTY stats") +
  theme(plot.title = element_text(hjust = 0.5))

