source("load_data.R")

# 
plot1 <- function(df=NULL){
  if(is.null(df))
    df <- load_data()
  ## Plot 1
  png(filename="plot1.png", height=480, width=480)
  
  
  hist(df$Global_active_power, main="Global Active Power",
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  
  dev.off()
}