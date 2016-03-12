setwd("~/datascienceclass/Class4_ExploratoryDA/exdata-data-household_power_consumption")
HouseholdData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                          nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

HouseholdData$Date <- as.Date(HouseholdData$Date, format="%d/%m/%Y")

HHsubset <- subset(HouseholdData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(HHsubset$Date), HHsubset$Time)
HHsubset$Datetime <- as.POSIXct(datetime)

plot(HHsubset$Global_active_power~HHsubset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()