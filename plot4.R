setwd("e://my learning/coursera/r/pract")
power <- read.table("household_power.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric",7)),na="?")
head(power)
dim(power)
finaldata <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
head(finaldata)
dim(finaldata)
attach(finaldata)
date_time <- paste(Date, Time)
head(date_time)
a <- strptime(date_time, "%d/%m/%Y %H:%M:%S")
head(finaldata)
png(filename = "plot4.png", width = 480, height = 480, units = 'px', bg = 'transparent') 
par(mfrow = c(2, 2))
plot(a, Global_active_power, type = "l", xlab = "", ylab ="Global Active Power")
plot(a, Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
plot(a, Sub_metering_1, type ="l", col="black", xlab = "", ylab = "Energy sub metering")
lines(a, Sub_metering_2, col = "red")
lines(a, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("sub_metering_1", "sub_metering_2", "Sub_metering_3"), lwd =1)
plot(a, Global_reactive_power, type = "l", col="black", xlab = "datetime", ylab = "Global reactive power")
dev.off()

