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
y <- data$Global_active_power
#There I choose not to copy because otherwise my legend is truncated
png(filename = "plot3.png")
par(mfrow = c(1, 1))
plot(1:length(y),data$Sub_metering_1, xlab ="", ylab = "Energy sub metering",
     xaxt="n", type = "l")
lines(1:length(y),data$Sub_metering_2, col = "red")
lines(1:length(y),data$Sub_metering_3, col = "blue")
axis(1, c(1, length(y)/2, length(y)), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = "solid",col =c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
rm("y")
