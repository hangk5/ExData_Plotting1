
plot2<-function() {
  library(lubridate)
  library(dplyr)
  
  ## load data
  epc_data<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
  # 
  # filter only data for 02/01/2007 and 02/02/2007
  feb0102<-filter(epc_data, dmy(epc_data$Date)==dmy("1/2/2007")|dmy(epc_data$Date)==dmy("2/2/2007"))
  
  par(mfrow=c(1,1), mar=c(3,4,2,1))
  png(file="plot2.png")
  
  #plot of Global_active_power vs DateTime
  #DateTime - x axis of the plot
  x<-strptime(paste(feb0102$Date, feb0102$Time), "%d/%m/%Y %H:%M:%S")
  plot(x, feb0102$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
  
  dev.off()
  
}