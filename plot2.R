# Download and tidy data
source('readInData.R')

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(elCons$DateTime, elCons$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)", type = 'l')

dev.off()