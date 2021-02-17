library(tidyverse)
library(lintr)
library(styler)

NBA_rookies <-
  read.csv(
    "https://raw.githubusercontent.com/info201a-w21/project-luffyzor/main/Data/2019%20NBA%20Draft%20Rank.csv?token=AOSFANWDUZT5ICJD46M2B43AGSXTQ"
  )

points_per_game <- NBA_rookies %>%
  filter(PPG == max(PPG, na.rm = T)) %>%
  select(PPG) %>%
  sum(na.rm = T)

fg_percent <- NBA_rookies %>%
  filter(FG. == max(FG., na.rm = T)) %>%
  select(FG.) %>%
  sum(na.rm = T)

three_point_percent <- NBA_rookies %>%
  filter(X3P. == max(X3P., na.rm = T)) %>%
  select(X3P.) %>%
  sum(na.rm = T)

free_throw_percent <- NBA_rookies %>%
  filter(FT. == max(FT., na.rm = T)) %>%
  select(FT.) %>%
  sum(na.rm = T)

assist_per_game <- NBA_rookies %>%
  filter(AST.G == max(AST.G, na.rm = T)) %>%
  select(AST.G) %>%
  sum(na.rm = T)

summary <-
  list(
    "Points per game" = points_per_game,
    "Field goal percentage" = fg_percent,
    "Three point percentage" = three_point_percent,
    "Free throw percentage" = free_throw_percent,
    "Assists per game" = assist_per_game
  )