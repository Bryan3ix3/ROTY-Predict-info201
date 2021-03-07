# load your libraries
library("shiny")
library("ggplot2")
library("tidyverse")
library("plotly")
library("styler")
library("lintr")
library(ggplot2)
library(reshape2)
library("rsconnect")
library("DT")

# read data
historic_rookies <- read.csv("Data/ROTY Historic Stats.csv")
important_names_rookies <- read.csv("Data/Revised_ROTY Historic Stats.csv")
rookie_draft_2019 <- read.csv("Data/2019 NBA Draft Rank.csv")
rookie_names_2019 <- read.csv("Data/Revised_2019 NBA Draft Rank.csv")
rookie_season_2019 <- read.csv("Data/2019 Rookies.csv")
rookie_season_2019_names <- read.csv("Data/Revised_2019 Rookies.csv")
rookies_2019_pics <- read.csv("Data/NBA 2020 Rookies_Pics.csv")
rookies_season_2020 <- read.csv("Data/NBA 2020 Rookies.csv")
rookies_names_2020 <- read.csv("Data/Revised_NBA 2020 Rookies.csv")

names(rookie_draft_2019)[10] <- "FG%"
names(rookie_draft_2019)[11] <- "3P%"
names(rookie_draft_2019)[12] <- "FT%"
names(rookie_draft_2019)[15] <- "REB"
names(rookie_draft_2019)[16] <- "AST"
names(rookie_draft_2019)[21] <- "WSper48z"

names(rookie_names_2019)[10] <- "FG%"
names(rookie_names_2019)[11] <- "3P%"
names(rookie_names_2019)[12] <- "FT%"
names(rookie_names_2019)[15] <- "REB"
names(rookie_names_2019)[16] <- "AST"

# renames 2019 rookies single season stats columns
names(rookie_season_2019)[6] <- "FG%"
names(rookie_season_2019)[7] <- "3P%"
names(rookie_season_2019)[8] <- "FT%"
names(rookie_season_2019)[12] <- "FG%z"
names(rookie_season_2019)[13] <- "3P%z"
names(rookie_season_2019)[14] <- "FT%z"

# renames 2020 rookies single season stats columns
names(rookies_season_2020)[4] <- "FG%"
names(rookies_season_2020)[5] <- "3P%"
names(rookies_season_2020)[6] <- "FT%"
names(rookies_season_2020)[13] <- "FG%z"
names(rookies_season_2020)[14] <- "3P%z"
names(rookies_season_2020)[15] <- "FT%z"
names(rookies_season_2020)[19] <- "WSper48z"

names(important_names_rookies)[2] <- "player"

df <- historic_rookies[c("YEAR", "FG", "PPG", "REB", "AST", "BLK", "DP")]
df_melt <- reshape2::melt(df, id.var = "YEAR")
df_melt$player <- important_names_rookies$player

df2 <- rookie_names_2019[1:50, c("Pk", "PPG", "FG%", "3P%", "FT%", "AST",
                                 "REB")]

df2_melt <- reshape2::melt(df2, id.var = "Pk")
df2_melt$player <- rookie_names_2019$Player[1:50]

df3 <- rookie_draft_2019[1:50, c(
  "Pk", "Player", "PPG", "FG%", "3P%", "FT%", "AST", "REB", "WSper48z",
  "BPMz", "VORPz", "eScore"
)]

df4 <- rookie_season_2019[1:50, c("Rk", "PPG", "FG%", "3P%", "FT%", "AST",
                                  "REB")]
df4_table <- rookie_season_2019[1:50, c("Rk", "Player", "FG%z", "3P%z", "FT%z",
                                        "PPGz", "REBz", "ASTz", "iScore")]

df5 <- rookies_season_2020[1:46, c("Pk", "PPG", "FG%", "3P%", "FT%", "AST",
                                   "REB")]
df5_table <- rookies_season_2020[1:46, c(
  "Pk", "Tm", "Player", "FG%z", "3P%z", "FT%z", "PPGz", "REBz", "ASTz",
  "WSper48z", "BPMz", "VORPz", "iScore", "eScore"
)]

df5_melt <- reshape2::melt(df5, id.var = "Pk")
# was top 50 but deleted data for rows with all NA values
df5_melt$player <- rookies_names_2020$Player[1:46]

# melts data based on combined z score rank
df4_melt <- reshape2::melt(df4, id.var = "Rk")
df4_melt$player <- rookie_season_2019_names$Player[1:50]

server <- function(input, output) {
  # scatterplot stats for historic ROTY
  output$scatterplot <- renderPlotly({
    new_df <- df_melt %>%
      filter(variable == input$stats) %>%
      select(YEAR, value, player)

    my_plot <- ggplot(data = new_df) +
      geom_point(
        color = "maroon2",
        mapping = aes_string(x = "YEAR", y = "value"),
        size = input$size
      ) +
      geom_text(
        mapping = aes_string(
          x = "YEAR", y = "value", label = "player",
          colour = "player"
        ),
        size = 0.01, alpha = 0.8
      ) +
      labs(title = "Historic ROTY stats") +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

    ggplotly(my_plot)
  })

  # scatterplot stats for 2019 rookies career stats
  output$scatterplot2 <- renderPlotly({
    new_df <- df2_melt %>%
      filter(variable == input$stats2) %>%
      select(Pk, value, player)

    my_plot <- ggplot(data = new_df) +
      geom_point(
        mapping = aes_string(x = "Pk", y = "value"),
        size = input$size2, color = input$color
      ) +
      geom_text(
        mapping = aes_string(
          x = "Pk", y = "value", label = "player",
          colour = "player"
        ),
        size = 0.01, alpha = 0.8
      ) +
      labs(title = "2019 Rookie Career Season Stats") +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

    ggplotly(my_plot)
  })

  # displays data table for z scores of encompassing stats instead of indiv.
  output$table1 <- DT::renderDataTable({
    DT::datatable(df3[, c(2:12), drop = FALSE])
  })

  output$scatterplot3 <- renderPlotly({
    new_df <- df4_melt %>%
      filter(variable == input$stats2) %>%
      select(Rk, value, player)

    my_plot <- ggplot(data = new_df) +
      geom_point(
        mapping = aes_string(x = "Rk", y = "value"),
        size = input$size2, color = input$color
      ) +
      geom_text(
        mapping = aes_string(
          x = "Rk", y = "value", label = "player",
          colour = "player"
        ),
        size = 0.01, alpha = 0.8
      ) +
      labs(title = "2019 Rookie First Season Stats") +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

    ggplotly(my_plot)
  })

  output$table2 <- DT::renderDataTable({
    DT::datatable(df4_table[, , drop = FALSE])
  })

  output$img1 <- renderUI({
    img(src = rookies_2019_pics[rookies_2019_pics$Player == input$player,
                                "url"])
  })

  output$table3 <- DT::renderDataTable({
    DT::datatable(df5_table[, , drop = FALSE])
  })

  df5_temp <- rookies_season_2020[, c("Pk", "Player", "PPG", "FG%", "3P%",
                                      "FT%", "AST", "REB")]
  # individual 2019 rookie stats
  output$table4 <- DT::renderDataTable({
    subset(df5_temp, df5_temp$Player == input$player)
  })

  # 2020 Rookie Stats
  output$scatterplot4 <- renderPlotly({
    new_df <- df5_melt %>%
      filter(variable == input$stats3) %>%
      select(Pk, value, player)

    my_plot <- ggplot(data = new_df) +
      geom_point(
        color = "maroon2",
        mapping = aes_string(x = "Pk", y = "value"),
        size = input$size3
      ) +
      geom_text(
        mapping = aes_string(
          x = "Pk", y = "value", label = "player",
          colour = "player"
        ),
        size = 0.01, alpha = 0.8
      ) +
      labs(title = "2020 Rookie stats") +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

    ggplotly(my_plot)
  })

  # daniels chart
  output$scatterplot5 <- renderPlotly({
    filtered_data <- rookie_season_2019[, c("PPG", "3P%")] %>%
      filter(PPG >= input$size4)

    my_plot <- ggplot(data = filtered_data) +
      geom_point(
        mapping = aes_string(x = filtered_data$"3P%", y = "PPG"),
        size = input$size2, color = input$color
      ) +
      labs(
        title = "Ratio of Points Per Game to 3-Point Percentage",
        x = "3-Point Percentage",
        y = "Points Per Game"
      ) +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "none")

    ggplotly(my_plot) # What makes a chart interactive
  })
}
#shinyApp(ui = ui, server = server)
