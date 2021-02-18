library(tidyverse)
library(lintr)
library(styler)

nba_rookies <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor/main/Data/2019%20NBA%20Draft%20Rank.csv?token=AOSFANWDUZT5ICJD46M2B43AGSXTQ")
nba_rookies <- na.omit(nba_rookies)

# calculates 2019 rookie with highest PPG
points_per_game <- nba_rookies %>%
  filter(PPG == max(PPG, na.rm = T)) %>%
  select(PPG) %>%
  sum(na.rm = T)
highest_ppg_player <- nba_rookies$Player[nba_rookies$PPG == points_per_game]
ppg_df <- paste(points_per_game, "by", highest_ppg_player)

# calculates 2019 rookie with highest FG%
fg_percent <- nba_rookies %>%
  filter(FG. == max(FG., na.rm = T)) %>%
  select(FG.) %>%
  sum(na.rm = T)
highest_fg_percent_player <- nba_rookies$Player[nba_rookies$FG. == fg_percent]
fg_percent_df <- paste(fg_percent, "by", highest_fg_percent_player)

# calculates 2019 rookie with highest 3 point %
three_point_percent <- nba_rookies %>%
  filter(X3P. == max(X3P., na.rm = T)) %>%
  select(X3P.) %>%
  sum(na.rm = T)
highest_three_ppp <- nba_rookies$Player[nba_rookies$X3P. == three_point_percent]
three_pp_df <- paste(three_point_percent, "by", highest_three_ppp)

# calculates 2019 rookie with free throw %
free_throw_percent <- nba_rookies %>%
  filter(FT. == max(FT., na.rm = T)) %>%
  select(FT.) %>%
  sum(na.rm = T)
highest_ft_pp <- nba_rookies$Player[nba_rookies$FT. == free_throw_percent]
ft_df <- paste(free_throw_percent, "by", highest_ft_pp)

# calculates 2019 rookie with highest assists per game
assist_per_game <- nba_rookies %>%
  filter(AST.G == max(AST.G, na.rm = T)) %>%
  select(AST.G) %>%
  sum(na.rm = T)
highest_assist_per_game <- nba_rookies$Player[nba_rookies$AST.G ==
                                                assist_per_game]
assists_df <- paste(assist_per_game, "by", highest_assist_per_game)

summary <-
  list("Highest Points per game" = ppg_df,
    "Highest Field goal percentage" = fg_percent_df,
    "Highest Three point percentage" = three_pp_df,
    "Highest Free throw percentage" = ft_df,
    "Highest Assists per game" = assists_df)
