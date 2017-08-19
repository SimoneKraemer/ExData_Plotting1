# Download and unzip file if it does not exist already
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("ElectricPowerConsumption.zip"))
    {
        download.file(url,
                      destfile='ElectricPowerConsumption.zip',
                      mode="wb")
    }

if (!dir.exists("./ElectricPowerConsumption"))
    {
        unzip(zipfile = "ElectricPowerConsumption.zip",
              exdir = "./ElectricPowerConsumption")
    }

# Calculate how many rows are needed (2 days with 1 minute sampling time)
nrows <- 2*24*60
# Read in only relevant data
header <- read.table(file = "./ElectricPowerConsumption/household_power_consumption.txt",
                     header = FALSE,
                     nrows = 1,
                     sep =';')
elCons <- read.table(file = "./ElectricPowerConsumption/household_power_consumption.txt",
                     header = FALSE,
                     skip = 66637,
                     nrows = nrows,
                     sep =';',
                     na.strings = "?")
colnames(elCons) <- unlist(header)

# Convert date and time format
elCons$Date <- as.Date(as.character(elCons$Date), "%d/%m/%Y")
elCons$Time <- as.character(elCons$Time)
elCons["DateTime"] <- as.POSIXct(paste(elCons$Date, elCons$Time),
                                 format="%Y-%m-%d %H:%M:%S")
# Delete unused columns and reorder
elCons <- elCons[, c("DateTime", "Global_active_power", "Global_reactive_power",
                   "Voltage", "Global_intensity", "Sub_metering_1",
                   "Sub_metering_2", "Sub_metering_3")]

rm(header, nrows, url)

