# Download and tidy data
source('readInData.R')

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfcol = c(2,2))
# Plot 1,1
plot(elCons$DateTime, elCons$Global_active_power,
     xlab = "", ylab = "Global Active Power", type = 'l')
# Plot 2,1
plot(elCons$DateTime, elCons$Sub_metering_1,
     xlab = "", ylab = "Energy sub metering", type = 'n')
points(elCons$DateTime, elCons$Sub_metering_1, type = 'l', col = "black")
points(elCons$DateTime, elCons$Sub_metering_2, type = 'l', col = "red")
points(elCons$DateTime, elCons$Sub_metering_3, type = 'l', col = "blue")
legend(x = 'topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"), bty = 'n')

# Plot 1,2
plot(elCons$DateTime, elCons$Voltage,
     xlab = "datetime", ylab = "Voltage", type = 'l')

# Plot 2,2
plot(elCons$DateTime, elCons$Global_reactive_power,
     xlab = "datetime", ylab = "Global_reactive_power", type = 'l')

dev.off()