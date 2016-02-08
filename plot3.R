rawData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

rawData$Date <- as.Date(rawData$Date, format = "%d/%m/%Y")

febData <- rawData[ ( rawData$Date == as.Date("2007-02-01")  | rawData$Date == as.Date("2007-02-02") ), ]

febData$Time <- strptime(paste(febData$Date, febData$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png")

plot(x = febData$Time, y = febData$Sub_metering_1, type = "l"
     , xlab = "", ylab = "Energy sub metering")
lines(x = febData$Time, y = febData$Sub_metering_2,  col = "red")
lines(x = febData$Time, y = febData$Sub_metering_3,  col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
