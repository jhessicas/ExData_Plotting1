## Note: My language is Portuguese (Brazil). This way, the axes of my plot2.png 
## are qui, sex and sab (instead of thu, fri, sat)

## Plot2
library("data.table")

## read the file
## epc = Eletrical power consumption
epc <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
##head(epc)

## You may find it useful to convert the Date and Time variables to Date/Time 
## classes in R using the strptime() and as.Date() functions.
epc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
epc <- epc[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

## Construct the plot and save it to a PNG file with a width of 480 pixels and 
## a height of 480 pixels.
png("plot2.png", width = 480, height = 480)

## Plot2 - Global Active Power

plot(x = epc[, dateTime] , y = epc[, Global_active_power],
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()