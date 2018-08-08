###Reading data
powerdata <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/household_power_consumption.txt", header = TRUE, sep= ";",na.string = "?")
### Subsetting data for  relevant dates
reqddata <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007" ))
### creating the graph
hist(reqddata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
### copying it to png with specified width and height
dev.copy(png, "plot1.png", width=480, height= 480) 
### shutting the png device off
dev.off()
