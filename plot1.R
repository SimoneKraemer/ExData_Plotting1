# Download and tidy data
source('readInData.R')

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")

hist(elCons$Global_active_power, breaks = 11, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()