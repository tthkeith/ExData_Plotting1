
##  Store Full Data in Memory
Full_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';',na.string="?")
Full_Data$Date <- as.Date(Full_Data$Date, format="%d/%m/%Y")


##  Subset Data to 2007/02/01 to 2007/02/02
Sub_Data <- subset(Full_Data, subset=(Full_Data$Date >= "2007-02-01" & Full_Data$Date <= "2007-02-02"))


## Merge and Convert Date and Time
Sub_Data$Date_Time <- paste(Sub_Data$Date,Sub_Data$Time) 
Sub_Data$Date_Time <- strptime(Sub_Data$Date_Time, format="%Y-%m-%d %H:%M:%S") 


par(mar=c(3,4.5,2,1))


## Plot Graph
plot(Sub_Data$Date_Time, Sub_Data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n")
lines(Sub_Data$Date_Time, Sub_Data$Sub_metering_1, col = "black")
lines(Sub_Data$Date_Time, Sub_Data$Sub_metering_2, col = "red")
lines(Sub_Data$Date_Time, Sub_Data$Sub_metering_3, col = "blue")
legend("topright", cex=0.75,  lty=1, lwd=2 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save Graph to png file
dev.copy(png, file = "Plot3.png", height = 480, width = 480)
dev.off()