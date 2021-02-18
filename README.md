# Final Project
*By Ali Al-Shimari, Daniel Baek, Bryan Chucha, Kristi Nguyen, Brian Yoo*
## Project Proposal
### Domain of interest: NBA Stats

**Why are you interested in this field/domain?**  
We are interested in predicting who will be rookie of the year (ROTY) based on current rookie stats.

**What other examples of data driven project have you found related to this domain (share at least 3)?**  
1) James Harden's performance based on the visiting city's strip club rating: Quite inappropriate, but it is by far the most well-known, detailed data analysis project published on Reddit and went viral on Twitter, which inspired a whole wave of studies for NBA stats.  
2) The adaptation of the 3 point shot (rise over time)  
3) Predicting whether a college player will make it into the NBA based on their college basketball stats

**What data-driven questions do you hope to answer about this domain (share at least 3)?**  
1) How closely correlated is the rookie's draft place with how well they perform in their rookie season?  
2) How important is PPG in relation to ROTY?  
3) Are offensive or defensive players more likely to get ROTY?

## Finding Data
**Where did you download the data (e.g., a web URL)?**  
1) [NBA 2021 Rookies](https://www.basketball-reference.com/leagues/NBA_2021_rookies.html):
Includes all the rookies' current stats (detailed) like points per game, field goal percentage, three point percentage, etc. There are 60 rows and 22 columns.
This data set can be used to answer the "Are offensive or defensive players more likely to get ROTY?" because it includes stats on defensive rebounds, steals, blocks (which a positive number indicates they are a defensive player). Positive and high stats on 3 pointers, field goal attempts, would indicate more of an
offensive player.

2) [Draft Rank](https://www.basketball-reference.com/draft/NBA_2020.html):
Quite similar to the first data set, but includes which number they were drafted at, their current team, and additional advanced stats (number of wins contributed by the player per 48 minutes, etc). Like the last data set, there are 60 rows and 22 columns. This data set would answer the "How closely correlated is the rookie's draft place with how well they perform in their rookie season?" because it includes what place they were drafted at.

3) [Current Rookie Rankings by Stats](https://hashtagbasketball.com/nba-rookie-rankings):
Includes all the rookies' stats, but unlike the first link, it includes a ranking of each NBA rookie in their respective draft class based on all of their current stats which is factored into a scoring system. This can serve as a framework as we evaluate which stats are the most important to evaluate most accurately how to predict rookie of the year. There are 54 rows and 16 columns. This data set would answer the "How important is PPG in relation to ROTY?" because it provides stats on the rookies' points per game.

*All of the data from these websites are third party websites who collect data from the NBA's official site, (which posts updated stats for every NBA game), and condense it. We did not choose to download directly from the NBA official website because of HTML coding problems which makes the data difficult to download from.
