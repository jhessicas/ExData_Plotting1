## Plot1
library("data.table")

## read the file
## epc = Eletrical power consumption
epc <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
##head(epc)

## You may find it useful to convert the Date and Time variables to Date/Time 
## classes in R using the strptime() and as.Date() functions.
## Here I used as.Data():
epc[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
## We will only be using data from the dates 2007-02-01 and 2007-02-02.
epc <- epc[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## Construct the plot and save it to a PNG file with a width of 480 pixels and 
## a height of 480 pixels.
png("plot1.png", width = 480, height = 480)

## Plot1 - Global Active Power
## Histogram

hist(epc[, Global_active_power], main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()