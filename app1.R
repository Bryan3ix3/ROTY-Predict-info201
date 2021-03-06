# load your libraries
library("shiny")
library("plotly")
library("tidyverse")

# read in your files (make sure to double check path)
source("app_ui.R")
source("app_server.R")

# You will need to fill in the `app_ui.R` file to create the layout.
# Run the app through this file.

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
# Create your shiny app by defining the UI and server
shinyApp(ui = ui, server = server)

