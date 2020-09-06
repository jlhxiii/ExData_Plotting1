#Plot 4#


rawdata <- read.csv("household_power_consumption.txt", header=T, sep=';',
                    na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F,
                    comment.char="", quote='\"')


chronology <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))

chronology$Date <- as.Date(chronology$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(chronology$Date), chronology$Time)

chronology$Datetime <- as.POSIXct(datetime)



#Set up the plot#
par(mfrow=c(2,2),mar=c(4,4,4,4), oma = c(0,0,2,0))


#Method 1, piecewise#

#Plot 4, Graph 1#

with(chronology, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})      



#Graph 4,2#
with(chronology, plot(
  Voltage ~ Datetime, type = "l", ylab = "Voltage"
)
)



#Graph 4,3

with(chronology, {plot(
  Sub_metering_1 ~ Datetime, type = "l", ylab = "" , xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = "red")
  lines(Sub_metering_3 ~ Datetime, col = "blue")})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c(
  "Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
)

#Graph 4,4#

with(chronology, plot(
  Global_reactive_power ~ Datetime, type = "l"
)
)

dev.copy(png, file = "plot4.png", heigh = 480, width = 480)
dev.off()

##Right now this results in everything looking great BUT the legend##




#Method 2#



par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(chronology, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l")
})

dev.copy(png, file = "plot4.png", heigh = 480, width = 480)
dev.off()

##This one gives virtually the same result but the legend is even worse##