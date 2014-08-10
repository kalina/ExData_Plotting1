source("load_data.R")

plot3 <- function(df=NULL){
  if(is.null(df))
    df <- load_data()
  
  png(filename="plot3.png", height=480, width=480)

  par(mar = c(7, 6, 5, 4))
  ## Plot 1
  plot(df$Datetime, df$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
  # type = "n" builds plots without points
  # xaxt = NULL suppresses x axis
  # xlab = "" removes the label from the x axis

  lines(df$Datetime, df$Sub_metering_1, col="black", type="S")
  lines(df$Datetime, df$Sub_metering_2, col="red", type="S")
  lines(df$Datetime, df$Sub_metering_3, col="blue", type="S")
  
  legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}