library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)
library(reshape2)

# reads stats of rookies of 2019
rookie_stats_2019 <- read.csv("Data/2019 NBA Draft Rank.csv")

# makes dataframe of top 50 draft picks with assists, rebounds, points per game
df <- rookie_stats_2019[1:50, c("Pk", "AST.G", "TRB.G", "PPG")]
head(df)

# melting data for assists, rebounds, and points per game
df_melt <- reshape2::melt(df, id.var = "Pk")

# makes dataframe of top 50 draft picks with field goal,free throw percentages
df2 <- rookie_stats_2019[1:50, c("Pk", "FG.", "FT.")]
head(df2)

# melting data for field goal and free throw percentages
df_melt2 <- reshape2::melt(df2, id.var = "Pk")

# plots assists, rebounds, points per game
points_plot <- ggplot(df_melt, aes(x = factor(Pk), y = value,
  colour = variable)) + geom_point() + xlab("Draft Pick") +
  ylab("Points") + ggtitle("2019 Rookie Stats") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_manual(name = "Points Stats",
    values = c("maroon2", "green", "dodgerblue1"),
    labels = c("Assists", "Rebounds", "Points Per Game")) +
  theme(axis.text.x = element_text(angle = 65), axis.ticks = element_blank())
print(points_plot)
# plots field goal and free throw percentages
percentage_plot <- ggplot(df_melt2, aes(x = factor(Pk), y = value,
  colour = variable)) + geom_point(size = 2) + xlab("Draft Pick") +
  ylab("Percent value") +
  ggtitle("2019 Rookie Percentage Stats") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_manual(name = "Percentage Stats",
    values = c("orchid2", "cyan3"),
    labels = c("Field Goal", "Free Throw")) +
  theme(axis.text.x = element_text(angle = 65))
