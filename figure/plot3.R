###Reading data
powerdata <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/household_power_consumption.txt", header = TRUE, sep= ";",na.string = "?")
### Subsetting data for relevant dates 
reqddata <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007" ))
datetime <- paste(as.Date(reqddata$Date,"%d/%m/%Y"), reqddata$Time)
reqddata$Datetime <- as.POSIXct(datetime)
### creating the graph
with(reqddata, plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering ", xlab="") )
lines(reqddata$Sub_metering_2~reqddata$Datetime, col="red")
lines(reqddata$Sub_metering_3~reqddata$Datetime, col="blue")
### adding legend
legend("topright", lty= 1, lwd =2 , col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
### copying it to png with specified width and height
dev.copy(png, "plot3.png", width=480, height= 480)
### shutting the png device off
dev.off()