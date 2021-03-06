# read table and ensure data are not imported as factors
x <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                stringsAsFactors = FALSE, na.strings = "?")
# subset the data
subx <- subset(x, x$Date == "1/2/2007" | x$Date == "2/2/2007")
# convert Global_active_power to numeric data
gap <- as.numeric(subx$Global_active_power)
# create date time
datetime <- strptime(paste(subx$Date, subx$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# create a praphic device
png("plot2.png", width = 480, height = 480)
# create line plot
plot(datetime, gap, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
