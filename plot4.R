#Plot4

fileName <- "household_power_consumption.txt"
df <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?",
                 colClasses = c("character", "character", rep("numeric",7)))

df <- subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))
df$dt  <- as.POSIXlt(paste(as.Date(df$Date,format="%d/%m/%Y"), df$Time, sep=" "))

png("plot4.png")

par(mfrow = c(2,2))

plot(df$dt, df$Global_active_power, type="l", ylab="Global Active Power",
     xlab="")

plot(df$dt, df$Voltage, type="l", ylab="Voltage",
     xlab="datetime")

plot(df$dt, df$Sub_metering_1, type="l", ylab="Energy sub metering",
     xlab="", col = "black")
lines(df$dt, df$Sub_metering_2, col="red")
lines(df$dt, df$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), bty= "n",lwd=1)

plot(df$dt, df$Global_reactive_power, type="S", ylab="Global_reactive_power",
     xlab="datetime")

par(mfrow = c(1,1))
dev.off()
