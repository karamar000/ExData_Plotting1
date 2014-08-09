#Read the data set into R
data <- read.table("Coursera_Exploratory Data Analysis/Project1/household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = '?', colClasses = c(rep('character', 2), rep('numeric', 7)))

#Convert Date to class Date
dataDate <- as.Date(data$Date, format = "%d/%m/%Y")
data <- cbind(data, dataDate)

#paste together date and time
data$dateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Subset for dates between 2007-02-01 and 2007-02-02
dataSub <- subset(data, data$dataDate >= "2007-02-01" & data$dataDate <= "2007-02-02")     

#Plot1
png(filename = "plot1.png", bg = "transparent")

hist(dataSub$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
     ylim = c(0,1200))

dev.off()

