
plot3<-function() {
  library(lubridate)
  library(dplyr)
  
  ## load data
  epc_data<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
  # 
  # filter only data for 02/01/2007 and 02/02/2007
  feb0102<-filter(epc_data, dmy(epc_data$Date)==dmy("1/2/2007")|dmy(epc_data$Date)==dmy("2/2/2007"))
  
  par(mfrow=c(1,1), mar=c(3,4,2,1))
  png(file="plot3.png")
  #plot of "energy sub metering 1,2,3" vs DateTime
  #DateTime - x axis of the plot
  x<-strptime(paste(feb0102$Date, feb0102$Time), "%d/%m/%Y %H:%M:%S")
  with(feb0102, plot(x, feb0102$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
  with(feb0102, points(x, feb0102$Sub_metering_1, col="black", type="l"))
  with(feb0102, points(x, feb0102$Sub_metering_2, col="red", type="l"))
  with(feb0102, points(x, feb0102$Sub_metering_3, col="blue", type="l"))
  
  #add legend
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.off()
  
}