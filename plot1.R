##Read Data
data <- read.table("data/household_power_consumption.txt", sep=";", header=TRUE)
##Convert Data$Date to date format
data$Date<- as.Date(data$Date,"%d/%m/%Y")
##Get Subset of Data
dataUse<- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
##Create Histogram
##Converting Global Active Power to Kilowatt
##Red Column
##X Label and Heading
hist(dataUse$Global_active_power/1000*2, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
##Copy to PNG
dev.copy(png, file="plot1.png")
##Close Copy Function
dev.off()