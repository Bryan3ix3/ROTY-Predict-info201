library("knitr")

NBA_rookies <- read.csv("https://raw.githubusercontent.com/info201a-w21/project-luffyzor/main/Data/ROTY%20Historic%20Stats.csv?token=ASMBEZPX6V65RW3JY3YHSHTAGDJ3C")

# avgs of G, C, F
avg_pos <- NBA_rookies %>% 
  group_by(POS) %>% 
  summarize(
    avg_ppg = mean(PPG),
    avg_reb = mean(REB),
    avg_ast = mean(AST),
    avg_blk = mean(BLK)
  )

kable(avg_pos)



