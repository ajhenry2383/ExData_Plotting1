library(plyr)
library(dplyr)

power <- read.table ("~/household_power_consumption.txt", sep=";",header=TRUE,colClasses="character")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$Time <- paste(power$Date, power$Time, sep=" ")
power$Time <- strptime(power$Time, "%Y-%m-%d %H:%M:%S")
power<- subset(power, Date == "2007-02-01" | Date == "2007-02-02",rownames=FALSE)
power[power %in% "?"] <- NA
power[,3:9] <- as.numeric(unlist(power[,3:9]))

plot1png<- png("plot1.png", width=480, height=480)
plot1 <- hist(power$Global_active_power, col="red", main = "Global Active Power", 
              xlab= "Global Active Power (kilowatts)", ylab="Frequency")
dev.off()




         


