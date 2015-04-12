
##  Store Full Data in Memory
Full_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';',na.string="?")
Full_Data$Date <- as.Date(Full_Data$Date, format="%d/%m/%Y")


##  Subset Data to 2007/02/01 to 2007/02/02
Sub_Data <- subset(Full_Data, subset=(Full_Data$Date >= "2007-02-01" & Full_Data$Date <= "2007-02-02"))


## Merge and Convert Date and Time
Sub_Data$Date_Time <- paste(Sub_Data$Date,Sub_Data$Time) 
Sub_Data$Date_Time <- strptime(Sub_Data$Date_Time, format="%Y-%m-%d %H:%M:%S")

## Set Plot parameters
par(mfrow=c(2,2))
par(mar=c(3,4,2,2))
par(mgp = c(1.5, 0.2, 0))


## Plot Graph
## Plot 1 
plot(Sub_Data$Date_Time, Sub_Data$Global_active_power, type="l",xlab = "", ylab ="Global Active Power", main = "")


## Plot 2 
plot(Sub_Data$Date_Time, Sub_Data$Voltage, type="l", xlab = "datetime", ylab = "Voltage", main = "")


## Plot 3
plot(Sub_Data$Date_Time, Sub_Data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n")
lines(Sub_Data$Date_Time, Sub_Data$Sub_metering_1, col = "black")
lines(Sub_Data$Date_Time, Sub_Data$Sub_metering_2, col = "red")
lines(Sub_Data$Date_Time, Sub_Data$Sub_metering_3, col = "blue")
legend("topright", cex=0.7,bty="n", y.intersp=0.8, x.intersp=0.2, lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Plot 4
plot(Sub_Data$Date_Time, Sub_Data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power", main = "")


## Save Graph to png file
dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()