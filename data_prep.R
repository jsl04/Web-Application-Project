mpg_data<- mtcars
mpg_data$am[which(mpg_data$am==0)] <- "Automatic"
mpg_data$am[which(mpg_data$am==1)] <- "Manual"
mpg_data$Transmission_Type<- as.factor(mpg_data$am)
mpg_data$model<- row.names(mpg_data)
mpg_data$Power_To_Weight_Ratio<- mpg_data$hp/mpg_data$wt

