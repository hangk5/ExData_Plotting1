
plot4<-function() {
  library(lubridate)
  library(dplyr)
  
  ## load data
  epc_data<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
  # 
  # filter only data for 02/01/2007 and 02/02/2007
  feb0102<-filter(epc_data, dmy(epc_data$Date)==dmy("1/2/2007")|dmy(epc_data$Date)==dmy("2/2/2007"))
  
  #DateTime - x axis of the plot
  x<-strptime(paste(feb0102$Date, feb0102$Time), "%d/%m/%Y %H:%M:%S")
  
  png(file="plot4.png", width=480, height=480)
  #set plot parameter to 2 cloumn, 2 rows
  par(mfrow= c(2,2), mar=c(4,4,1,1))
  #plot of Global_active_power vs DateTime at (1,1)
  plot(x, feb0102$Global_active_power, ylab="Global Active Power", xlab="", type="l")
  
  #plot of Voltage vs DateTime at (1,2)
  plot(x, feb0102$Voltage, ylab="Voltage", xlab="datetime", type="l")
  
  #plot of "energy sub metering 1,2,3" vs DateTime at (2,1)
  with(feb0102, plot(x, feb0102$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
  with(feb0102, points(x, feb0102$Sub_metering_1, col="black", type="l"))
  with(feb0102, points(x, feb0102$Sub_metering_2, col="red", type="l"))
  with(feb0102, points(x, feb0102$Sub_metering_3, col="blue", type="l"))
  #add legend
  legend("topright", lty=1, col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #plot of Global_reactive_power vs DataTime at (2,2)
  plot(x, feb0102$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
  
  dev.off()
  
}