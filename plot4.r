##Read Data
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Convert Data$Date to date format
data$Date<- as.Date(data$Date,"%d/%m/%Y")
##Get Subset of Data
dataUse<- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
##Create DateTime Value
dataUse$DateTime<- strptime(paste(dataUse$Date, dataUse$Time), "%Y-%m-%d %H:%M:%S")
##Create Plotting Area
par(mfrow = c(2, 2))
##Create Plot 1
with(dataUse,plot(DateTime, Global_active_power/1000*2, 
                  type = "l",
				  xlab = "", ylab = "Global Active Power"))
##Plot 2
with(dataUse,plot(DateTime, Voltage,
                   type = "l",
                  xlab = "datetime", ylab = "Voltage", yaxt="n"))
axis(2, c(1000,1400,1800,2200),c(234,238,242,246))
##Plot 3
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
##Plot 4
with(dataUse,plot(DateTime, Global_reactive_power,
              type = "l",
			  xlab = "datetime", yaxt="n"))
			  
axis(2, c(0,50,100,150,200),c(0.0,0.1,0.2,0.3,0.4))


##Copy to PNG
dev.copy(png, file="plot4.png")
##Close Copy Function
dev.off()






