## Exploratory Data Analtsis on Coursera -- ProgAssignment1
## Author: Josie.Tao Date: 10/05/2014 
## plot3.R -- Time Series of Global_Active_Power by Sub_metering
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

# Open plot3.png, set arguments
png("plot3.png", width = 480, height = 480, bg = NULL)

# Making Plot3
plot(myData$DateTime, 
     myData$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")

# Sub_metering_1
lines(myData$DateTime, myData$Sub_metering_1)
# Sub_metering_2
lines(myData$DateTime, myData$Sub_metering_2, col='red')
# Sub_metering_3
lines(myData$DateTime, myData$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# Close PNG file
dev.off()
