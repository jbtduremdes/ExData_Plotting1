## Clear console memory.
rm(list = ls())

## Set mfcrow, display only 1 plot.
par(mfrow = c(1, 1))

## Read and process source data.
power <- read.table(file = "household_power_consumption.txt",
     header = TRUE, 
     sep = ";",
     na.strings = "?")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, power$Date >= "2007-02-01" & power$Date <= "2007-02-02")
power$Datetime <- as.POSIXct(strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S"))

## Plot line graph.
plot(power$Global_active_power ~ power$Datetime,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power (kilowatts)")

## Plot and save to PNG, default width and height at 480px.
dev.copy(png, file = "plot2.png")
dev.off()