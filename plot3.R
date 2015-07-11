# read in data
file <- "E:\\My Documents\\Coursera\\ExpAnaly\\ProgAss1\\household_power_consumption.txt"
powerdf <- read.csv(file, sep=";", na.strings="?", header=TRUE)

# convert dates to date objects
powerdf$Date <- as.Date(powerdf$Date, format = "%d/%m/%Y")

# select only the dates 2007-02-01 and 2007-02-02
day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")
powerdf <- powerdf[powerdf$Date == day1 | powerdf$Date == day2,]

# combine date and time
powerdf$timedate <- as.POSIXct(paste(powerdf$Date, powerdf$Time),
                               format="%Y-%m-%d %H:%M:%S")

# open png device
imagefile <- "E:\\My Documents\\Github\\ExData_Plotting1\\plot3.png"
png(imagefile, width = 480, height = 480)

# make the plot
xlabel <- ""
ylabel <- "Energy sub metering"
with(powerdf, plot(timedate, Sub_metering_1, type="n", xlab = xlabel,
                   ylab = ylabel))
with(powerdf, lines(timedate, Sub_metering_1, col = "black"))
with(powerdf, lines(timedate, Sub_metering_2, col = "red"))
with(powerdf, lines(timedate, Sub_metering_3, col = "blue"))
legtext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = legtext)

# close the png device
dev.off()