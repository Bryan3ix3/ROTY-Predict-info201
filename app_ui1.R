# load your libraries
library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)
library(rsconnect)
library("styler")
library("lintr")

source("app_server.R")

# Define Widgets (shiny widget library here)
stats_input <- selectInput(
  inputId = "stats",
  choices = df_melt$variable,
  label = "Choose a statistic to visualize***",
)

size_input <- sliderInput(
  inputId = "size",
  label = "Set the point size",
  min = 1,
  max = 10,
  value = 1
)

# Define structure of tabs (aka pages) -- must make 2 tabs
one <- tabPanel(
  "Introduction",             #title of the page, what will appear as the tab name
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
  "Chart 1",
  titlePanel("Title"),
  br(),
  sidebarLayout(
    sidebarPanel(
      ),
    mainPanel(
      h2("Chart"),
    )
  ),
)

three <- tabPanel(
  "Title" 
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
  one
)
