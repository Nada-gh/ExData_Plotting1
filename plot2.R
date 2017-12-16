plot2<-function(){
  ## Reading data from .txt file
  dta<-fread("household_power_consumption.txt",sep=";",na.strings = "?",header = TRUE)
  
  
  ## subsitting data with only the required observations(2007-02-01 & 2007-02-02)
  ndta<-dta[which(dta$Date == "1/2/2007" | dta$Date == "2/2/2007"),]
  
  ## data preprocessing
  ndta$Date<-as.Date(ndta$Date, format="%d/%m/%Y")
  v<- as.POSIXct(paste(ndta$Date,ndta$Time))
  
  
  ndta[,timestmp:= v]
  
  ##Open a graphic device
  png(filename = "plot2.png",width = 480, height = 480)
  
  
  ##Plotting data for the consumption of the global active power over the given two days
  plot(ndta$timestmp,ndta$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
  
  ## Colse the PNG file
  dev.off()
}