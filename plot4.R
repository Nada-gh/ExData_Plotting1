plot4<- function(){
  ## Reading data from .txt file
  dta<-fread("household_power_consumption.txt",sep=";",na.strings = "?",header = TRUE)
  
  
  ## subsitting data with only the required observations(2007-02-01 & 2007-02-02)
  ndta<-dta[which(dta$Date == "1/2/2007" | dta$Date == "2/2/2007"),]
  
  ## data preprocessing
  ndta$Date<-as.Date(ndta$Date, format="%d/%m/%Y")
  p<- as.POSIXct(paste(ndta$Date,ndta$Time))
  
  
  ndta[,timestmp:= p]
  
  ##Open a graphic device
  png(filename = "plot4.png",width = 480,height = 480)
  
  par(mfrow=c(2,2))
  
  #first Plot
  plot(ndta$timestmp,ndta$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")  

  
  #Second Plot
  plot(ndta$timestmp,ndta$Voltage,type="l",xlab="datetime", ylab="Voltage")
  
  #Third Plot
  
  plot(ndta$timestmp,ndta$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
  
  lines(ndta$timestmp,ndta$Sub_metering_2,col="red")
  lines(ndta$timestmp,ndta$Sub_metering_3,col="blue")
  legend("topright",col = c("black","red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1),lwd=c(1,1),bty = "n",cex=.5)
  
  #Forth Plot 
  plot(ndta$timestmp,ndta$Global_reactive_power,type ="l",xlab = "datetime", ylab = "Global_reactive_power")
 
  
  ## Colse the PNG file
  dev.off()
}