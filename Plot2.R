#"PowCon.txt" refers to the Electric Power Consumption Dataset (renamed for convenience)

# Read the subset dating from Feb. 1 to Feb. 2, 2007 (skip to 66636, 2880 rows after)
x <- read.table("PowCon.txt", sep=";", header=T, na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)), skip = 66636, nrows = 2880)

# Add column names, like in "Plot 1.R"
colnames(x) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Construct POSIX from date and time string
x$datetime <- strptime(paste(x$Date, x$Time), '%d/%m/%Y %H:%M:%S')

# Plot 2 Graphic
png(filename = "plot2.png", bg = "transparent")
with(x, plot(datetime, Global_active_power, 'l', xlab = "", ylab = "Global Active Power (kilowatts)", main = ""))
dev.off()
