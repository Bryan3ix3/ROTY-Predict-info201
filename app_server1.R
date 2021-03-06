# load your libraries
# read in the data set 
library("shiny")
library("ggplot2")
library("tidyverse")
library("plotly")
#library("styler")
#library("lintr")
library(ggplot2)
library(reshape2)
library('rsconnect')

historic_rookies <- read.csv("Data/ROTY Historic Stats.csv")
important_names_rookies <- read.csv("Data/Revised_ROTY Historic Stats.csv")

df <- historic_rookies[c("YEAR","FG", "PPG", "REB", "AST", "BLK", "DP")]
df_melt <- reshape2::melt(df, id.var = "YEAR")
df_melt$PLAYER = important_names_rookies$PLAYER

server <- function(input, output) {
  output$scatterplot <- renderPlotly({
    new_df <- df_melt %>%
      filter(variable == input$stats) %>%
      select(YEAR, value, PLAYER)
    
    my_plot <- ggplot(data = new_df) +
      geom_point(color = "maroon2",
        mapping = aes_string(x = "YEAR", y = "value"),
        size = input$size
      ) +
      geom_text(mapping = aes_string(x = "YEAR", y = "value", label = "PLAYER",
                                     colour = "PLAYER"),
                size=0.01, alpha=0.5) +
      labs(title = "Historic ROTY stats") +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "none")
    
    ggplotly(my_plot)
  })
}

#shinyApp(ui = ui, server = server)

