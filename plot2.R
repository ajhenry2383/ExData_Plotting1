library(plyr)
library(dplyr)

power <- read.table ("~/household_power_consumption.txt", sep=";",header=TRUE,colClasses="character")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$Time <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")
power<- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
power[power %in% "?"] <- NA
power[,3:9] <- as.numeric(unlist(power[,3:9]))


plot2png<- png("plot2.png",height=480, width=480)
plot2 <- plot(power$Time, power$Global_active_power, type="l", xlab="", 
              ylab="Global Active Power (kilowatts)")
dev.off()


