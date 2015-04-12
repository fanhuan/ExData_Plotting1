#Plot 2
library(sqldf)
#read in the data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#extract data for 2007-02-01 and 2007-02-02 only
subset<-sqldf("select * from household_power_consumption where Date in ('1/2/2007','2/2/2007')")
#merge the Date and Time column
subset$Date<-paste(subset$Date, subset$Time)
#Format the Date column
subset$Date<-strptime(subset$Date,format="%d/%m/%Y %H:%M:%S")
#Plot 2
with(subset, plot(Date,Global_active_power,xlab='',ylab="Global Active Power (kilowatts)",type="l"))