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

#Plot3
png(filename = "plot3.png", bg = "transparent")

with(dataSub, plot(dateTime, Sub_metering_1, type = "l", 
                   xlab = "", ylab = "Energy sub metering"))
with(dataSub, points(dateTime, Sub_metering_2, type = "l", col = "red"))
with(dataSub, points(dateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

dev.off()