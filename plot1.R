plot1<- function(){
  ## Reading data from .txt file
  dta<-fread("household_power_consumption.txt",sep=";",na.strings = "?",header = TRUE)
  ## subsitting data with only the required observations(2007-02-01 & 2007-02-02)
  nwdta<-dta[which(dta$Date == "1/2/2007" | dta$Date == "2/2/2007"),]
  
  
  ##Open a graphic device
  png(filename = "plot1.png",width = 480, height = 480)
  
  
  ## Plotting the histogram for the subsitted data
  with(nwdta,hist(Global_active_power,col="red",main ="Global Active Power", xlab = "Global Active Power(kilowatts)"))
  
  ## Colse the PNG file
  dev.off()
}
