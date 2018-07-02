library("data.table")

project1Data <- "./project1/data/household_power_consumption.txt"

#Read data from file
data <- read.table(project1Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Set dates
extractedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Draw data
globalActivePower <- as.numeric(extractedData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()