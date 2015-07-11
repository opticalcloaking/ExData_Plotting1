# read in data
file <- "E:\\My Documents\\Coursera\\ExpAnaly\\ProgAss1\\household_power_consumption.txt"
powerdf <- read.csv(file, sep=";", na.strings="?", header=TRUE)

# convert dates to date objects
powerdf$Date <- as.Date(powerdf$Date, format = "%d/%m/%Y")

# select only the dates 2007-02-01 and 2007-02-02
day1 <- as.Date("2007-02-01")
day2 <- as.Date("2007-02-02")
powerdf <- powerdf[powerdf$Date == day1 | powerdf$Date == day2,]

# open png device
imagefile <- "E:\\My Documents\\Github\\ExData_Plotting1\\plot1.png"
png(imagefile, width = 480, height = 480)

# make the plot
title <- "Global Active Power"
xlabel <- "Global Active Power (kilowatts)"
hist(powerdf$Global_active_power, col = "red", main = title, xlab = xlabel)

# close the png device
dev.off()