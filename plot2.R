source("load_data.R")

 plot2 <- function(df=NULL){
     if(is.null(df))
         df <- load_data()

   png(filename="plot2.png", height=480, width=480)


   par(mar = c(6, 6, 5, 4))
   plot(df$Datetime, df$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
   # type = "n" builds plots without points
   # xaxt = NULL suppresses x axis
   # xlab = "" removes the label from the x axis
   lines(df$Datetime, df$Global_active_power, type="S")
   
   dev.off()
}