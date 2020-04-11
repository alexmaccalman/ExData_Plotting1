# read table and ensure data are not imported as factors
x <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                stringsAsFactors = FALSE, na.strings = "?")
# subset the data
subx <- subset(x, x$Date == "1/2/2007" | x$Date == "2/2/2007")

# create date time
datetime <- strptime(paste(subx$Date, subx$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# create a praphic device
png("plot3.png", width = 480, height = 480)
# create lines plots
with(subx, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub meeting"))
lines(datetime, subx$Sub_metering_2, lty = 1, col = "red")
lines(datetime, subx$Sub_metering_3, lty = 1, col = "blue")
legend("topright", col = c("Black", "Red", "Blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
