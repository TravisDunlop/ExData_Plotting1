rawData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

rawData$Date <- as.Date(rawData$Date, format = "%d/%m/%Y")

febData <- rawData[ ( rawData$Date == as.Date("2007-02-01")  | rawData$Date == as.Date("2007-02-02") ), ]

febData$Time <- strptime(febData$Time, format = "%H:%M:%S")

png(filename = "plot1.png")
hist(febData$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = c("red"))
dev.off()
