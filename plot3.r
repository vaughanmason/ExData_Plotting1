##Read Data
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Convert Data$Date to date format
data$Date<- as.Date(data$Date,"%d/%m/%Y")
##Get Subset of Data
dataUse<- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
##Create DateTime Value
dataUse$DateTime<- strptime(paste(dataUse$Date, dataUse$Time), "%Y-%m-%d %H:%M:%S")
##Create Plot
##Sub_metering_1
with(dataUse,plot(DateTime, Sub_metering_1, 
      type = "l",
      col = "black",
      xlab = "", ylab = "Energy sub metering"))
##Sub_metering_2
with(dataUse,lines(DateTime, Sub_metering_2, col = "red"))
##Sub_metering_3
with(dataUse,lines(DateTime, Sub_metering_3, col = "blue"))
##Create Legend
legend("topright", 
        col = c("black", "red", "blue"),
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lwd = 1)
##Copy to PNG
dev.copy(png, file="plot3.png")
##Close Copy Function
dev.off()






