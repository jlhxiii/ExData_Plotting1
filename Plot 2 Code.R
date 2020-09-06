#Plot 2#



#The 'type' argument in plot() determines the kind of plot made! 


rawdata <- read.csv("household_power_consumption.txt", header=T, sep=';',
                    na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F,
                    comment.char="", quote='\"')
chronology <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))
#Creates a dataframe vector called 'chronology' from a subset of the dataframe 'rawdata'
#Between the dates 1/2/2007 and 2/2/2007#
chronology$Date <- as.Date(chronology$Date, format="%d/%m/%Y")
#Modifies the format of the Date column of the chronology dataframe#
datetime <- paste(as.Date(chronology$Date), chronology$Time)
#Creates a vector call datetime by using the paste() function to 
#combine date and time (columns of data & in practicality), allowing us 
#to see hour & minute data across days.
chronology$Datetime <- as.POSIXct(datetime)

with(chronology, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
#Recall: With() command is using chronology dataframe to perform 
#the plot() function with global active power in relation to the datetime
#vector, of type line, and the x label had to be manually removed
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
