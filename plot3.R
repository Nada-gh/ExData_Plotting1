plot3 <- function(){
  ## Reading data from .txt file
  dta<-fread("household_power_consumption.txt",sep=";",na.strings = "?",header = TRUE)
  
  
  ## subsitting data with only the required observations(2007-02-01 & 2007-02-02)
  ndta<-dta[which(dta$Date == "1/2/2007" | dta$Date == "2/2/2007"),]
  
  ## data preprocessing
  ndta$Date<-as.Date(ndta$Date, format="%d/%m/%Y")
  v<- as.POSIXct(paste(ndta$Date,ndta$Time))
  
  
  ndta[,timestmp:= v]
  
  ##Open a graphic device
  png(filename = "plot3.png",width = 480, height = 480)
  
  ##Plotting data for the first sub_metering vatiable
  plot(ndta$timestmp,ndta$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
  
  #adding the other data to the plot
  lines(ndta$timestmp,ndta$Sub_metering_2,col="red")
  
  lines(ndta$timestmp,ndta$Sub_metering_3,col="blue")
  
  legend("topright",col = c("black","red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),lty=1)
  
  ## Colse the PNG file
  dev.off()
}