## Exploratory Data Analtsis on Coursera -- ProgAssignment1
## Author: Josie.Tao Date: 10/05/2014 
## plot1.R -- Histogram of Global_active_power

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

# Open plot1.png, set arguments
png("plot1.png", width = 480, height = 480, bg = NULL)
# Making Plot1
hist(myData$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
# Close png file
dev.off()