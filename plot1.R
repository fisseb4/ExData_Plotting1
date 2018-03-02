## First set working directory with the unzipped file

setwd("/home/pseudo/Arbeitsfläche/Coursera/Exploratory_data_analysis/week1")

# Import Data

import <- read.table("household_power_consumption.txt",sep=";",header=T,na.strings = c("?",""))

## Substract the dates of interest
subs <- filter(import, Date == "1/2/2007" | Date == "2/2/2007")

## Create plot

png(file = "plot1.png", width = 480, height = 480)
hist(subs$Global_active_power, main="Global Active Power", col="brown", xlab="Global Active Power (kilowatts)")
dev.off()