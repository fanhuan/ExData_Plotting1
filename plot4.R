#Plot 4
library(sqldf)
#read in the data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#extract data for 2007-02-01 and 2007-02-02 only
subset<-sqldf("select * from household_power_consumption where Date in ('1/2/2007','2/2/2007')")
#merge the Date and Time column
subset$Date<-paste(subset$Date, subset$Time)
#Format the Date column
subset$Date<-strptime(subset$Date,format="%d/%m/%Y %H:%M:%S")
#Plot 4
par(mfrow=c(2,2))
#subplot 1 = Plot 2
with(subset, plot(Date,Global_active_power,xlab='',ylab="Global Active Power (kilowatts)",type="l"))
#subplot 2
with(subset, plot(Date,Voltage,xlab='datetime',type="l"))
#subplot 3 = Plot 3
with(subset, plot(Date,Sub_metering_1,xlab='',ylab="Energy sub metering",type="l"))
with(subset, points(Date,Sub_metering_2,xlab='',ylab="Energy sub metering",type="l",col="red"))
with(subset, points(Date,Sub_metering_3,xlab='',ylab="Energy sub metering",type="l",col="blue"))
#fix the size for the legend
legend(locator(n=1),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       cex=0.5, lty=c(1,1,1))
#Note that I'm using locator to locate the legend. Please click on the plot with your
#mouse to put the legend where you want it to be after run this line of code above.
#subplot 4
with(subset, plot(Date,Global_reactive_power,xlab='datetime',type="l"))
