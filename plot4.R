library(plyr)
library(dplyr)

power <- read.table ("~/household_power_consumption.txt", sep=";",header=TRUE,colClasses="character")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$Time <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")
power<- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
power[power %in% "?"] <- NA
power[,3:9] <- as.numeric(unlist(power[,3:9]))

plot4png <-png("plot4.png", height=480, width=480)
par(mfcol=c(2,2))

plot4a <- plot(power$Time, power$Global_active_power, type="l", xlab="", 
              ylab="Global Active Power")
plot4b <- { plot(power$Time, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  points(power$Time, power$Sub_metering_2, type="l",col="red")
  points(power$Time, power$Sub_metering_3, type ="l", col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=1, col=c("black", "red", "blue"))
}
plot4c <- plot(power$Time, power$Voltage, type="l", xlab="datetime", 
              ylab="Voltage")
plot4d <- plot(power$Time, power$Global_reactive_power, type="l", xlab="datetime", 
              ylab="Global_reactive_power")
par(mfcol=c(1,1))
dev.off()
