trythis <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#I can see for myself that the code is telling R the document 
#has a header,
#is separated by ;
#NA or void entries are represented with ?
#there will be 2075259 rows
#not sure what the check.names is about
#or stringsAsFactors
#comment characters are ""
#quotes are denoted with '\"'



Timeframe <- subset(trythis, Date %in% c("1/2/2007","2/2/2007"))

#  %in% is value matching and "returns a vector of the positions of (first) 
#matches of its first argument in its second"
#For operators or arguments such as this, see
help('%in%') 

#Note the format for searching or isolating data between a set or range of dates!



#Plot 1#

GlobalActivePower <- Timeframe$Global_active_power  

hist(GlobalActivePower, xlab = "Global Active Power", ylab = "Frequency", 
     main = "Global Active Power", col = "red")

#Now to save to PNG

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
