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
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

## Plot4 - Global Active Power, Voltage, Energy sub metering, Global_reactive_power

# Graphic 1
plot(epc[, dateTime], epc[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Graphic 2
plot(epc[, dateTime],epc[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Graphic 3
plot(epc[, dateTime], epc[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(epc[, dateTime], epc[, Sub_metering_2], col="red")
lines(epc[, dateTime], epc[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Graphic 4
plot(epc[, dateTime], epc[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

