# Download and tidy data
source('readInData.R')

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

plot(elCons$DateTime, elCons$Sub_metering_1,
     xlab = "", ylab = "Energy sub metering", type = 'n')
points(elCons$DateTime, elCons$Sub_metering_1, type = 'l', col = "black")
points(elCons$DateTime, elCons$Sub_metering_2, type = 'l', col = "red")
points(elCons$DateTime, elCons$Sub_metering_3, type = 'l', col = "blue")
legend(x = 'topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

dev.off()
