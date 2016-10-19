library(plyr)
library(dplyr)

power <- read.table ("~/household_power_consumption.txt", sep=";",header=TRUE,colClasses="character")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$Time <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")
power<- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
power[power %in% "?"] <- NA
power[,3:9] <- as.numeric(unlist(power[,3:9]))

plot3png<-png("plot3.png",height=480,width=480)
plot3 <- { plot(power$Time, power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
            points(power$Time, power$Sub_metering_2, type="l",col="red")
            points(power$Time, power$Sub_metering_3, type ="l", col="blue")
            legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   lty=1, col=c("black", "red", "blue"), bty="n")
}

dev.off()