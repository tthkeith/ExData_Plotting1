
##  Store Full Data in Memory
Full_Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';',na.string="?")
Full_Data$Date <- as.Date(Full_Data$Date, format="%d/%m/%Y")


##  Subset Data to 2007/02/01 to 2007/02/02
Sub_Data <- subset(Full_Data, subset=(Full_Data$Date >= "2007-02-01" & Full_Data$Date <= "2007-02-02"))


## Merge and Convert Date and Time
Sub_Data$Date_Time <- paste(Sub_Data$Date,Sub_Data$Time) 
Sub_Data$Date_Time <- strptime(Sub_Data$Date_Time, format="%Y-%m-%d %H:%M:%S") 


## Plot Graph
plot(Sub_Data$Date_Time, Sub_Data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")


##Saves Graph to png file
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()