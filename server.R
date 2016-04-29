
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)
library(dplyr)
library(rCharts)
library(markdown)

mpg_data<- mtcars
mpg_data$am[which(mpg_data$am==0)] <- "Automatic"
mpg_data$am[which(mpg_data$am==1)] <- "Manual"
mpg_data$Transmission_Type<- as.factor(mpg_data$am)
mpg_data$model<- row.names(mpg_data)
mpg_data$Power_To_Weight_Ratio<- mpg_data$hp/mpg_data$wt

shinyServer(function(input,output){
  output$mychart<- renderChart({
    p1<-rPlot(input$Cylinders, input$Transmission,data = mpg_data, type= "point", tooltip= "#!function(item){ return 'Car Model: ' + item.model + ' Power to Weight Ratio: ' + item.Power_To_Weight_Ratio + ' MPG: ' + item.mpg }!#")
    p1$addParams(dom='mychart')
    return(p1)
  })
})


