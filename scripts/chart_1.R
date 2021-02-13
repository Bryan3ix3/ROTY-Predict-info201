library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)
library(reshape2)

#reads stats of rookies of 2019
rookie_stats_2019 <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor
                              /main/Data/2019%20NBA%20Rookies.csv?token=ASMBEZJAQ3JDMJJNFKAXHLDAGC2LE")

#makes dataframe of top 50 rookies with assists, rebounds, points per game
df <- rookie_stats_2019[1:50, c('Rk','AST','TRB', 'PPG')]
head(df)

#melting data for assists, rebounds, and points per game
df_melt <- reshape2::melt(df, id.var = 'Rk')

#makes dataframe of top 50 rookies with field goal and free throw percentages
df2 <-rookie_stats_2019[1:50, c('Rk', 'FG','FT')]
head(df)

#melting data for field goal and free throw percentages
df_melt2 <- reshape2::melt(df, id.var = 'Rk')

#plots assists, rebounds, points per game
ggplot(df_melt, aes(x = factor(Rk), y= value, colour = variable)) + 
  geom_point() + xlab('Rank') 

#plots field goal and free throw percentages
ggplot(df_melt2, aes(x = factor(Rk), y= value, colour = variable)) + 
  geom_point() + xlab('Rank') 
