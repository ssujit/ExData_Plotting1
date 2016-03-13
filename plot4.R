#Assignment: Course Project 1
#Plot 3: Plot for multivarriate comparison
#reading data file


# working directory and get file name
getwd()
setwd("D:/Datascience/ExploratoryDataAnalysis/Week1")
list.files()


# reading .txt data and attach in the R environment
sourceData <- "./data/household_power_consumption.txt"
plot4.data <-
  read.table(
    sourceData, sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = "."
  )


# subsetting data witin dates 2007-02-01 and 2007-02-0

subsetplot4.data <-
  plot4.data[plot4.data$Date %in% c("1/2/2007","2/2/2007"),]

# checking varriable class and convert to numeric
names(subsetplot4.data)
str(subsetplot4.data)
globalActivepower <-
  as.numeric(subsetplot4.data$Global_active_power)

# covert variable to required date and time format
Date.Time <- strptime(paste(subsetplot4.data, subsetplot4.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# converting submeter variable in numeric
subMetering1 <- as.numeric(subsetplot4.data$Sub_metering_1)
subMetering2 <- as.numeric(subsetplot4.data$Sub_metering_2)
subMetering3 <- as.numeric(subsetplot4.data$Sub_metering_3)

# converting voltage and reactive power data varriable in numeric
globalReactivepower <- as.numeric(subsetplot4.data$Global_reactive_power)
voltage <- as.numeric(subsetplot4.data$Voltage)

# ploting trendline according to day after setting graphical devise 
png("plot4.png", width = 480, height = 480)
plot(Date.Time, globalActivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Date.Time, voltage, type="l", xlab="Date Time", ylab="Voltage")

plot(Date.Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date.Time, subMetering2, type="l", col="red")
lines(Date.Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub-metering-1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Date.Time, globalReactivepower, type="l", xlab="Date Time", ylab="Global reactive power")
dev.off()