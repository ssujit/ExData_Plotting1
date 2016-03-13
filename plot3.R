#Assignment: Course Project 1
#Plot 3: Plot submeter data
#reading data file


# working directory and get file name
getwd()
setwd("D:/Datascience/ExploratoryDataAnalysis/Week1")
list.files()


# reading .txt data and attach in the R environment
sourceData <- "./data/household_power_consumption.txt"
plot3.data <-
  read.table(
    sourceData, sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = "."
  )


# subsetting data witin dates 2007-02-01 and 2007-02-0

subsetplot3.data <-
  plot3.data[plot3.data$Date %in% c("1/2/2007","2/2/2007"),]

# checking varriable class and convert to numeric
names(subsetplot3.data)
str(subsetplot3.data)
globalActivepower <-
  as.numeric(subsetplot3.data$Global_active_power)

# covert data to required date and time format
Date.Time <- strptime(paste(subsetplot3.data, subsetplot3.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# converting submeter data in numeric
subMetering1 <- as.numeric(subsetplot3.data$Sub_metering_1)
subMetering2 <- as.numeric(subsetplot3.data$Sub_metering_2)
subMetering3 <- as.numeric(subsetplot3.data$Sub_metering_3)



# ploting trendline according to day after setting graphical devise 
png("plot3.png", width = 480, height = 480)
plot(Date.Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date.Time, subMetering2, type="l", col="red")
lines(Date.Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()