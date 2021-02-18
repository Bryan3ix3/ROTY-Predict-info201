library(tidyverse)
library(knitr)
library(dplyr)

rookie_stats_2019 <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor/main/Data/2019%20NBA%20Draft%20Rank.csv?token=ASMBEZPLPMPY376YTZLLSRDAGGPZU")
historic_stats <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor/main/Data/ROTY%20Historic%20Stats.csv?token=ASMBEZPX6V65RW3JY3YHSHTAGDJ3C")

View(rookie_stats_2019)
View(historic_stats)

# rename some columns
rookie_stats_2019 %>%
  colnames(rookie_stats_2019) %>%
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "Pk"] <- "Pick"
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "Tm"] <- "Team"
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "G"] <- "Games"
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "FG."] <- "FG%"
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "X3P."] <- "3PT%"
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "FT."] <- "FT%"
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "TRB.G"] <- "TRB/G"
  colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "AST.G"] <- "AST/G"



