setwd("~/datascienceclass/Class4_ExploratoryDA/exdata-data-household_power_consumption")
HouseholdData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                          nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

HouseholdData$Date <- as.Date(HouseholdData$Date, format="%d/%m/%Y")
Householdsubset <- subset(HouseholdData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

HHtime <- paste(as.Date(Householdsubset$Date), Householdsubset$Time)
Householdsubset$HHtime <- as.POSIXct(HHtime)

hist(Householdsubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
