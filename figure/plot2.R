###Reading data
powerdata <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/household_power_consumption.txt", header = TRUE, sep= ";",na.string = "?")
### Subsetting data for relevant dates 
reqddata <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007" ))
datetime <- paste(as.Date(reqddata$Date,"%d/%m/%Y"), reqddata$Time)
reqddata$Datetime <- as.POSIXct(datetime)
### creating the graph
with(reqddata,  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
### copying it to png with specified width and height
dev.copy(png, "plot2.png", width=480, height= 480)
### shutting the png device off
dev.off()
