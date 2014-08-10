#plot4 - 4 plots

source("load_data.R")

plot4 <- function(df=NULL){
   if(is.null(df))
     df <- load_data()

   png(filename="plot4.png", height=480, width=480, units="px")

   par(mfrow = c(2,2), mar = c(14, 7, 2, 2)+.2, 
       cex=.5, cex.lab=1.5, 
       cex.axis=1.5,
       mgp=c(4,1,0))
   
   #plot 2 - top left
   plot(df$Datetime, df$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")
   lines(df$Datetime, df$Global_active_power, type="S")
   
   #voltage - top right
   plot(df$Datetime, df$Voltage, xaxt=NULL, xlab = "", ylab = "Voltage", type="n")
   lines(df$Datetime, df$Voltage, type="S")
   
   ## Plot 3 - bottom left
   plot(df$Datetime, df$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
   
   # type = "n" builds plots without points
   # xaxt = NULL suppresses x axis
   # xlab = "" removes the label from the x axis
   lines(df$Datetime, df$Sub_metering_1, col="black", type="S")
   lines(df$Datetime, df$Sub_metering_2, col="red", type="S")
   lines(df$Datetime, df$Sub_metering_3, col="blue", type="S")
   
   legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.5, bty="n")
   
   #global reactive power - bottom right
   
   plot(df$Datetime, df$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab="Global_reactive_power", type="n")
   lines(df$Datetime, df$Global_reactive_power, type="S")
   
   dev.off()
}