
##  Store Full Data in Memory
Full_Data <- read.table("household_power_consumption.txt", sep=";", na.string="?", header=TRUE)
Full_Data$Date <- as.Date(Full_Data$Date, format="%d/%m/%Y")


##  Subset Data to 2007/02/01 to 2007/02/02
Sub_Data <- subset(Full_Data, subset=(Full_Data$Date >= "2007-02-01" & Full_Data$Date <= "2007-02-02"))

## Set Plot parameters
par(mar=c(3,4,2,2))


##  Plot Graph
hist(Sub_Data$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 


##  Save Graph to png file
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
