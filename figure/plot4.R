###Reading data
powerdata <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/household_power_consumption.txt", header = TRUE, sep= ";",na.string = "?")
### Subsetting data for relevant dates 
reqddata <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007" ))
datetime <- paste(as.Date(reqddata$Date,"%d/%m/%Y"), reqddata$Time)
reqddata$Datetime <- as.POSIXct(datetime)
### creating the graph
## setting the screen to fit two rows and two columns of graphs
par(mfrow=c(2,2)) 
##plotting the first graph
with(reqddata,  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab=""))
##plotting the second graph
with(reqddata,  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")) 
##plotting the third graph
with(reqddata, plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="") )
lines(reqddata$Sub_metering_2~reqddata$Datetime, col="red")
lines(reqddata$Sub_metering_3~reqddata$Datetime, col="blue")
legend("topright", lty= 1, lwd =2 , col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), cex = 0.75)
##plotting the fourth graph
with(reqddata,  plot(Global_reactive_power~Datetime, type="l", xlab="datetime")) 
### copying it to png with specified width and height
dev.copy(png, "plot4.png", width=480, height= 480) 
### shutting the png device off
dev.off()