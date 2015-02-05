#Plot1

fileName <- "household_power_consumption.txt"
df <- read.table(fileName, header = TRUE, sep = ";",na.strings = "?",
      colClasses = c("character", "character", rep("numeric",7)))

df <- subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png")

hist(df$Global_active_power, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
