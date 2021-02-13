library(styler)
library(tidyverse)
library(ggplot2)
library(reshape2)

#reads historical data of ROTY's
historic_stats <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor
                           /main/Data/ROTY%20Historic%20Stats.csv?token=ASMBEZJIB56QSK5RZ5E4FXTAGDGFS")

#making dataframe of important stats
df <- historic_stats[, c('YEAR','PPG','AST', 'REB')]
head(df)

#melting data so it can be graphed 
df_melt <- reshape2::melt(df, id.var = 'YEAR')

#line graph
ggplot(df_melt, aes(x = YEAR, y= value, colour = variable)) + 
  geom_line() + xlab('YEAR') 