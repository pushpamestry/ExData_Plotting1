#Plot3

fileName <- "household_power_consumption.txt"
df <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?",
                 colClasses = c("character", "character", rep("numeric",7)))

df <- subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))
df$dt  <- as.POSIXlt(paste(as.Date(df$Date,format="%d/%m/%Y"), df$Time, sep=" "))

png("plot3.png")

plot(df$dt, df$Sub_metering_1, type="l", ylab="Energy sub metering",
     xlab="", col = "black")
lines(df$dt, df$Sub_metering_2, col="red")
lines(df$dt, df$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),  lwd=1)

dev.off()
