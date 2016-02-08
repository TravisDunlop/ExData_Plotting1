rawData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

rawData$Date <- as.Date(rawData$Date, format = "%d/%m/%Y")

febData <- rawData[ ( rawData$Date == as.Date("2007-02-01")  | rawData$Date == as.Date("2007-02-02") ), ]

febData$Time <- strptime(paste(febData$Date, febData$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png")

plot(x = febData$Time, y = febData$Global_active_power, type = "l"
     , xlab = "", ylab = "Global Active Power (kilowats)")

dev.off()
