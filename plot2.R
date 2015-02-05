#Plot2

fileName <- "household_power_consumption.txt"
df <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?",
                 colClasses = c("character", "character", rep("numeric",7)))

df <- subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))
df$dt  <- as.POSIXlt(paste(as.Date(df$Date,format="%d/%m/%Y"), df$Time, sep=" "))

png("plot2.png")

plot(df$dt, df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()
