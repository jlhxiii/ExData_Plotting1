#Plot 3# 



#Recall that we add LINES to an existing graph with the lines() argument


rawdata <- read.csv("household_power_consumption.txt", header=T, sep=';',
                    na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F,
                    comment.char="", quote='\"')


chronology <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))

chronology$Date <- as.Date(chronology$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(chronology$Date), chronology$Time)

chronology$Datetime <- as.POSIXct(datetime)



with(chronology, {plot(
  Sub_metering_1 ~ Datetime, type = "l", ylab = "" , xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = "red")
  lines(Sub_metering_3 ~ Datetime, col = "blue")})
#Since we're using a command exclusive to creating lines, we do NOT specify
#the type as "l." This will cause errors related to every argument past 'type!'

#Note the rough brackets {} surrounding the plot() and lines() functions! Similar
#To algebra, this seems to tell R to use the timeframe 'chronology' to perform
#all of the functions contained within {} #


legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c(
  "Sub Metering 1", "Sub Metering 2", "Sub Metering 3")
)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()