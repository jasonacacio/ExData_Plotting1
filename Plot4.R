#"PowCon.txt" refers to the Electric Power Consumption Dataset (renamed for convenience)

# Read the subset dating from Feb. 1 to Feb. 2, 2007 (skip to 66636, 2880 rows after)
x <- read.table("PowCon.txt", sep=";", header=T, na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)), skip = 66636, nrows = 2880)

# Add column names, like in "Plot 3.R"
colnames(x) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Construct POSIX from date and time string
x$datetime <- strptime(paste(x$Date, x$Time), '%d/%m/%Y %H:%M:%S')

# Plot 4 Graphic
png(filename = "plot4.png", bg = "transparent")
par(mfrow = c(2, 2))

# first graph
with(x, plot(datetime, Global_active_power, 'l', xlab = "", ylab = "Global Active Power", main = ""))

# second graph
with(x, plot(datetime, Voltage, 'l'))

# third graph
with(x, plot(datetime, Sub_metering_1, 'l', xlab = "", main = "", ylab = "Energy sub metering"))
with(x, points(datetime, Sub_metering_2, 'l', col = "red"))
with(x, points(datetime, Sub_metering_3, 'l', col = "blue"))
legend('topright', legend = c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# fourth graph
with(x, plot(datetime, Global_reactive_power, 'l'))

dev.off()
