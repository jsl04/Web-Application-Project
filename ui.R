
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)
library(dplyr)
library(rCharts)
library(markdown)

shinyUI(pageWithSidebar(
  headerPanel("Interactive chart on comparing power to weight ratio to miles per gallon"),
  
  sidebarPanel(
    sliderInput("mpg",
                "Range:",
                min=10.4,
                max =33.9,
                value = c(10.4,33.9),
                sep = ""),
    sliderInput("Power_to_Weight",
                "Range:",
                min = 19.43574,
                max = 93.83754,
                value = c(19.43574,93.83754),
                sep = "")
  ),
  mainPanel(
    showOutput("mychart","polycharts")
  )
)
)

