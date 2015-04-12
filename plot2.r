##Read Data
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Convert Data$Date to date format
data$Date<- as.Date(data$Date,"%d/%m/%Y")
##Get Subset of Data
dataUse<- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
##Create Histogram
##Converting Global Active Power to Kilowatt
##Red Column
##Y Lab and Remove X Lab
with(dataUse, plot(Global_active_power/1000*2, type="l", ylab="Global Active Power (kilowatts)",xlab="", xaxt="n"))
##Create X Ticks
axis(1,c(0,1440,2880),c("Thu","Fri","Sat"))
##Copy to PNG
dev.copy(png, file="plot2.png")
##Close Copy Function
dev.off()