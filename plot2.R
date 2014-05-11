## Exploratory Data Analtsis on Coursera -- ProgAssignment1
## Author: Josie.Tao Date: 10/05/2014 
## plot2.R -- Time Series of Global_active_power
## Note: Use column DateTime for x axis, if you're not working in a english local environment
## then weekdays will be in wrong langauge. 
## Sys.setlocale("LC_TIME", "English") 

# Load Data from txt file to csv file
myData <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";", 
                   colClasses = c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?")
# Convert the Date and Time variables to "%d/%m/%Y %H:%M:%S" classes in R using the strptime() 
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
# Subset data from the dates 2007-02-01 and 2007-02-02. 
myData <- subset(myData, as.Date(DateTime) >= as.Date("2007-02-01") &
                         as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot2.png, set arguments
png("plot2.png", width = 480, height = 480, bg = NULL)

# Making Plot2 (Time Series of Global_active_power)
plot(myData$DateTime, myData$Global_active_power,pch = NA,
     xlab="", ylab="Global Active Power (kilowatts)")
lines(myData$DateTime, myData$Global_active_power)

# Close PNG file
dev.off()