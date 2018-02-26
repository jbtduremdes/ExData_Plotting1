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

## Plot histogram.
hist(power$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)")

## Plot and save to PNG, default width and height at 480px.
dev.copy(png, file = "plot1.png")
dev.off()