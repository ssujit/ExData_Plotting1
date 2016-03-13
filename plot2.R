#Assignment: Course Project 1
#Plot 1: Histogram
#reading data file


# working directory and get file name
getwd()
setwd("D:/Datascience/ExploratoryDataAnalysis/Week1")
list.files()


# reading .txt data and attach in the R environment
sourceData <- "./data/household_power_consumption.txt"
plot2.data <-
  read.table(
    sourceData, sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = "."
  )


# subsetting data witin dates 2007-02-01 and 2007-02-0

subsetplot2.data <-
  plot2.data[plot2.data$Date %in% c("1/2/2007","2/2/2007"),]

# checking varriable class and convert to numeric
names(subsetplot2.data)
str(subsetplot2.data)
globalActivepower <-
  as.numeric(subsetplot2.data$Global_active_power)

# covert data to required date and time format

Date.Time <- strptime(paste(subsetplot2.data, subsetplot2.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# ploting trendline according to day after setting graphical devise 
png("plot2.png", width = 480, height = 480)
plot(Date.Time, globalActivepower, type="1", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()