setwd("~/datascienceclass/Class4_ExploratoryDA/exdata-data-household_power_consumption")
HouseholdData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                          nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

HHsubset <- HouseholdData[HouseholdData$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(HHsubset$Date, HHsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(HHsubset$Global_active_power)
globalReactivePower <- as.numeric(HHsubset$Global_reactive_power)
voltage <- as.numeric(HHsubset$Voltage)
subMetering1 <- as.numeric(HHsubset$Sub_metering_1)
subMetering2 <- as.numeric(HHsubset$Sub_metering_2)
subMetering3 <- as.numeric(HHsubset$Sub_metering_3)

par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), border ="white" )
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()