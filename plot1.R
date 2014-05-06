#First load all data between 01/2/2007 and 02/2/2007
fileName <- "household_power_consumption.txt"
lines <- grep('^[1-2]/2/2007', readLines(fileName))
skip <- lines[1] - 1
nrows <- length(lines)
data <- read.table(fileName, sep = ";", na.strings = "?", skip = skip, nrows = nrows)
#Add header
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                 "Sub_metering_3")
rm("skip", "lines", "nrows")

#Plot
png(filename = "plot1.png")
par(mfrow = c(1, 1))
hist(data$Global_active_power, breaks=12, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
#Export as a PNG file
dev.off()  ## Don't forget to close the PNG device!