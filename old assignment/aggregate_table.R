library(tidyverse)
library(knitr)
library(dplyr)
library(styler)
library(lintr)

rookie_stats_2019 <- read.csv("data/2019 NBA Draft Rank.csv")
historic_stats <- read.csv("data/ROTY Historic Stats.csv")

# Renamed Columns
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "Pk"] <- "Pick"
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "Tm"] <- "Team"
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "G"] <- "Games"
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "FG."] <- "FG%"
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "X3P."] <- "3PT%"
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "FT."] <- "FT%"
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "TRB.G"] <- "TRB/G"
colnames(rookie_stats_2019)[colnames(rookie_stats_2019) == "AST.G"] <- "AST/G"

colnames(historic_stats)[colnames(historic_stats) == "POS"] <- "Position"
colnames(historic_stats)[colnames(historic_stats) == "FG"] <- "FG%"

# Groups historic ROTYs by their college
rookies_2019_college <- rookie_stats_2019 %>%
  group_by(College) %>%
  summarize(Players = n()) %>%
  arrange(desc(Players))

# Groups historic ROTYs by their position played
historic_pos <- historic_stats %>%
  group_by(Position) %>%
  summarize(Players = n(), "Average Points" = mean(PPG),
            "Average Assists" = mean(REB),
            "Average Rebounds" = mean(AST),
            "Average Blocks" = mean(BLK)) %>%
  mutate_if(is.numeric, round, digits = 2)

# Groups historic ROTYs by their team
historic_tm <- historic_stats %>%
  group_by(TEAM) %>%
  summarize(Players = n(), "Average Points" = mean(PPG)) %>%
  mutate_if(is.numeric, round, digits = 2) %>%
  arrange(desc(Players))
