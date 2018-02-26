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

## Plot line graph; add 2 more lines.
plot(power$Sub_metering_1 ~ power$Datetime,
     type = "l",
     xlab = " ",
     ylab = "Energy sub metering")
lines(power$Sub_metering_2 ~ power$Datetime, col = "Red")
lines(power$Sub_metering_3 ~ power$Datetime, col = "Blue")

## Add legend.
legend("topright", 
     col = c("Black", "Red", "Blue"),
     lty = 1,
     legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
     cex = 0.60)

## Plot and save to PNG, default width and height at 480px.
dev.copy(png, file = "plot3.png")
dev.off()