#downloads and unzips files if not present.
#loads the data and returns a data frame with the formatted datetime

load_data <- function(){
  
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  file <- "exdata_data_household_power_consumption.zip"
  txt_file = "household_power_consumption.txt"
  
  if(!file.exists(txt_file)){
    download.file(url, file, method="curl")
    unzip(file)
  }
  
  data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  
  data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
  
  #filter by dates
  df <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  for(i in c(3:9)) {df[,i] <- as.numeric(as.character(df[,i]))}
  #format the date
  df$Datetime <- strptime(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")

  return(df)
}