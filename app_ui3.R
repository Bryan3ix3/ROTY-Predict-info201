# Page 3
# Daniel Baek

library(ggplot2)
library(shiny)



size_input <- sliderInput(
  inputId = "size",
  label = "Minimum Points Per Game",
  min = 0,
  max = 24,
  value = 1
)

ui <- fluidPage(
 titlePanel("NBA 2019 Rookie Stats"),
 sidebarLayout(
   sidebarPanel(
     size_input),
   mainPanel(
     plotlyOutput(outputId = "scatter"),
     p("This chart shows the raito between points made per game and the percentage of 3-pointers
       made for each rookie. As the game of basketball is changing and the 3-point shot being
       more prevalant in games, we wanted to see how a rookie's 3-point percentage compared
       to their points per game and overall their position to win ROTY. From this graph,
       we can see that the rookie with the highest highest ratio of 3-pointers and points per game
       was actually not the ROTY.")
     )
    )
  )