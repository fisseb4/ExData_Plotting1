## First set working directory with the unzipped file

setwd("/home/pseudo/Arbeitsfläche/Coursera/Exploratory_data_analysis/week1")

# Import Data

import <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings = c("?",""))

## Substract the dates of interest
subs <- filter(import, Date == "1/2/2007" | Date == "2/2/2007")


## Reformat Date, necessary to get the same result as the required plot
subs$Date <- as.Date(subs$Date, format = "%d/%m/%Y")
subs$timetemp <- paste(subs$Date, subs$Time)
subs$Time <- strptime(subs$timetemp, format = "%Y-%m-%d %H:%M:%S")


## Create plot

png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(x=subs$Time, y= subs$Global_active_power ,type= "l", ylab="Global Active Power (kilowatts)", xlab="")

plot(x=subs$Time, y=subs$Voltage,type= "l", ylab="Voltage", xlab="datetime")



plot(x=subs$Time, y= subs$Sub_metering_1 ,type= "l", ylab="Energy sub metering", xlab="")
lines(x=subs$Time, y= subs$Sub_metering_2, col="brown" )
lines(x=subs$Time, y= subs$Sub_metering_3, col="blue")
legend("topright", lty = 1, col=c("black","brown","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x=subs$Time, y=subs$Global_reactive_power,type= "l", ylab="Global_reactive_power", xlab="datetime")




dev.off()
