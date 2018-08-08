powerdata <- read.table("C:/Users/Deepti/Documents/GettingandCleaningData/household_power_consumption.txt", header = TRUE, sep= ";",na.string = "?")
reqddata <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007" ))
hist(reqddata$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width=480, height= 480) 
dev.off()