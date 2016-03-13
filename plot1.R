#Assignment: Course Project 1
#Plot 1: Histogram
#reading data file


# working directory and get file name
getwd()
setwd("D:/Datascience/ExploratoryDataAnalysis/Week1")
list.files()


# reading .txt data and attach in the R environment
sourceData <- "./data/household_power_consumption.txt"
plot1.data <-
  read.table(
    sourceData, sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = "."
  )


# subsetting data witin dates 2007-02-01 and 2007-02-0

subsetplot1.data <-
  plot1.data[plot1.data$Date %in% c("1/2/2007","2/2/2007"),]

# checking varriable class and convert to numeric
names(subsetplot1.data)
str(subsetplot1.data)
globalActivepower <-
  as.numeric(subsetplot1.data$Global_active_power)


# ploting historgram after setting graphical devise as predefiend
png("plot1.png", width = 480, height = 480)
hist(globalActivepower, col = "red", main = "Global Active Power", xlab =
       "Global Active Power (kilowatts)")
dev.off()
