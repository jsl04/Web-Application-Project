
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

mpg_data<-datasets::mtcars
mpg_data$am[which(mpg_data$am==0)] <- "Automatic"
mpg_data$am[which(mpg_data$am==1)] <- "Manual"
mpg_data$Transmission_Type<- as.factor(mpg_data$am)
mpg_data$model<- row.names(mpg_data)
mpg_data$Power_To_Weight_Ratio<- mpg_data$hp/mpg_data$wt
mpg_data<- mpg_data[-9]

shinyUI(pageWithSidebar(
  headerPanel("Interactive Graph for Motor Trend Vehicle Data featuring Power To Weight Ratio"),
  
  sidebarPanel(
    selectInput(inputId = "x",
                label = "Choose Car Variable",
                choices = colnames(mpg_data),
                selected = "Power_To_Weight_Ratio"),
    selectInput(inputId = "y",
                label = "Choose Car Variable to Compare with Selection Above",
                choices = colnames(mpg_data),
                selected = "mpg"),
    selectInput(inputId = "z",
                label = "Choose Car Variable to Segment Data Points by Color",
                choices = colnames(mpg_data),
                selected = "Transmission_Type")
  ),
  mainPanel(
    showOutput("myChart", "polycharts"),
    h4 ("About this dashboard and how to use it"),
    p("This dashboard is meant for car buyers interested in the vehicles listed in the motortrend data included with R dataset package. Use the three selectors on the side to pick out which measures you want to compare.
      Use the first selector to choose the x axis variable, the second selector to choose the y axis variable, and the third selector to choose a variable to segement to data by color. 
      In addition, you can hover over each data point to see the vehicle model, the power to weight ratio, and the miles per gallon ",
      style="font-family: 'times';font-si16pt")
  )
))


