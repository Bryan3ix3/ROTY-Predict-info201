# load your libraries
library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(rsconnect)
library("styler")
library("lintr")

source("app_server1.R")

# Define Widgets (shiny widget library here)
stats_input <- selectInput(
  inputId = "stats",
  choices = df_melt$variable,
  label = "Choose a statistic to visualize***",
)

stats_input2 <- selectInput(
  inputId = "stats2",
  choices = df2_melt$variable,
  label = "Choose a statistic to visualize***",
)

stats_input3 <- selectInput(
  inputId = "stats3",
  choices = df5_melt$variable,
  label = "Choose a statistic to visualize***",
)

size_input <- sliderInput(
  inputId = "size",
  label = "Set the point size",
  min = 1,
  max = 10,
  value = 1
)

size_input2 <- sliderInput(
  inputId = "size2",
  label = "Set Point Size",
  min = 1,
  max = 24,
  value = 1
)

size_input3 <- sliderInput(
  inputId = "size3",
  label = "Set the point size",
  min = 1,
  max = 19,
  value = 2
)

size_input4 <- sliderInput(
  inputId = "size4",
  label = "Minimum Points Per Game",
  min = 1,
  max = 24,
  value = 1
)

player_input <- selectInput(
  inputId = "player",
  choices = rookies_2019_pics$Player,
  label = "Choose a rookie (Top 20 Draft Picks)",
)

color_input <- radioButtons(
  inputId = "color",
  choiceValues = c("purple2", "green", "dodgerblue1"),
  choiceNames = list("Purple", "Green", "Blue"),
  label = "Choose a color"
)

# Define structure of tabs (aka pages) -- must make 2 tabs
one <- tabPanel(
  "Historic ROTY",             #title of the page, what will appear as the tab name
  sidebarLayout(             
    sidebarPanel( 
      # left side of the page 
      # insert widgets or text here -- their variable name(s), NOT the raw code
      stats_input,
      size_input
    ),           
    mainPanel(                # typically where you place your plots + texts
      # insert chart and/or text here -- the variable name NOT the code
      plotlyOutput(outputId = "scatterplot"),
      br(),
    )))

two <- tabPanel(
  "2019-2020 NBA Rookies",
  sidebarLayout(
    sidebarPanel(
      h4("For Use with only Scatterplot tabs"),
      stats_input2,
      size_input2,
      color_input,
      h4("For Use with only Ratio tabs"),
      size_input4
      ),
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Career Advanced Statistics Table",
                           DT::dataTableOutput("table1")),
                  tabPanel("Career Stats Scatterplot",
                          plotlyOutput(outputId = "scatterplot2")),
                  tabPanel("First Season Advanced Statistics Table",
                          DT::dataTableOutput("table2")),
                  tabPanel("First Season Stats Scatterplot",
                          plotlyOutput(outputId = "scatterplot3")),
                  tabPanel("First Season Ratio of PPG to 3P% Scatterplot",
                           plotlyOutput(outputId = "scatterplot5"))
      )
  ),
)
)

three <- tabPanel(
  "2020-2021 NBA Rookies",
  sidebarLayout(
    sidebarPanel(
      h4("For Use with only Scatterplot tabs"),
      stats_input3,
      size_input3,
      h4("For use with face tab"),
      player_input
    ),
  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Season Advanced Statistics Table",
                         DT::dataTableOutput("table3")),
                tabPanel("Season Stats Scatterplot",
                         plotlyOutput(outputId = "scatterplot4")),
                tabPanel("I want to see rookie face",
                         uiOutput("img1")),
                         DT::dataTableOutput("table4"))
                ),
  )
)



four <- tabPanel(
  "Title" 
)

five <- tabPanel(
  "Summary/Takeaways" 
)

# Define the UI and what pages/tabs go into it
ui <- navbarPage(
  "Final Project", 
  one,
  two,
  three
)
