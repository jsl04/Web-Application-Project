
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)

shinyUI(pageWithSidebar(
  headerPanel("Interactive chart on comparing power to weight ratio to miles per gallon"),
  
  sidebarPanel(
    selectInput(inputId="Transmission",
                label = "Choose Transmission",
                choices = c("Automatic","Manual"),
                selected = "Manual"),
    selectInput(inputId="Cylinders",
                label = "Choose Cylinders",
                choices = c(4,6,8),
                selected = 4)
  ),
  mainPanel(
    showOutput("mychart","polycharts")
  )
)
)

