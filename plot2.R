library("data.table")

project1Data <- "./project1/data/household_power_consumption.txt"

#Read data from file
data <- read.table(project1Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Set dates
extractedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Draw data
dateTime <- strptime(paste(extractedData$Date, extractedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(extractedData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()