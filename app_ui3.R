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
 titlePanel("Comparison of "),
 sidebarLayout(
   sidebarPanel(
     size_input),
   mainPanel(
     plotlyOutput(outputId = "scatter")
     )
    )
  )