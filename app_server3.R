
rookie_stats <- read.csv("Data/2019 NBA Rookies.csv", stringsAsFactors = F)


library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(dplyr)
library(styler)
library(lintr)



server <- function(input, output){
  output$scatter <- renderPlotly({
    filtered_data <- rookie_stats %>% 
      filter(PPG >= input$size)
    
    my_plot <- ggplot(data = filtered_data) +
      geom_point(mapping = aes_string(x = filtered_data$X3P, y = filtered_data$PPG)) +
      labs(title = "Ratio of Points Per Game to 3-Point Percentage",
           x = "3-Point Percentage",
           y = "Points Per Game")
     
     ggplotly(my_plot) #What makes a chart interactive
    
  })
}