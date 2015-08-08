
plot1<-function() {
  library(lubridate)
  library(dplyr)
  
  ## load data
  epc_data<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
  # 
  # filter only data for 02/01/2007 and 02/02/2007
  feb0102<-filter(epc_data, dmy(epc_data$Date)==dmy("1/2/2007")|dmy(epc_data$Date)==dmy("2/2/2007"))
  
  #histogram of Global_active_power
  par(mfrow=c(1,1), mar=c(4,4,3,1))
  png(file="plot1.png")
  
  hist(feb0102$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

  dev.off()
  
}