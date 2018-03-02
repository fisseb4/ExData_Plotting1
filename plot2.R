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

png(file = "plot2.png", width = 480, height = 480)
plot(x=subs$Time, y= subs$Global_active_power ,type= "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
