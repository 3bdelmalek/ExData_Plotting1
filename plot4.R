
library("data.table")

project1Data <- "./project1/data/household_power_consumption.txt"

#Read data from file
data <- read.table(project1Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
extractedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Set Data
dateTime <- strptime(paste(extractedData$Date, extractedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(extractedData$Global_active_power)
globalReactivePower <- as.numeric(extractedData$Global_reactive_power)
voltage <- as.numeric(extractedData$Voltage)
subMetering1 <- as.numeric(extractedData$Sub_metering_1)
subMetering2 <- as.numeric(extractedData$Sub_metering_2)
subMetering3 <- as.numeric(extractedData$Sub_metering_3)

#Draw data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()