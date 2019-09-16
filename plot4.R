library(dplyr)
library(lubridate)
library(tidyr)
data1<-read.table('Course4/household_power_consumption.txt', sep=';', header=TRUE)


#2007-02-01 and 2007-02-02
data1$Date<-dmy(data1$Date)
data1<-data1%>%
  filter(Date>=as.Date("2007-02-01"))%>%
  filter(Date<=as.Date("2007-02-02"))

data1$DateTime<-paste(data1$Date, data1$Time)
data1$DateTime<-ymd_hms(data1$DateTime)
#plot4

###start here

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

##plot2
with(data1, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Globla Active Power (kilowatts)"))




data1$Voltage<-as.numeric(as.character(data1$Voltage))
with(data1, plot(DateTime, Voltage, type='l', xlab="datetime", ylab="Voltage"))     

##Plot3
plot3<-data1[,c("DateTime", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]

plot3$Sub_metering_1<-as.numeric(as.character(plot3$Sub_metering_1))
plot3$Sub_metering_2<-as.numeric(as.character(plot3$Sub_metering_2))


with(plot3, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(plot3, points(DateTime, Sub_metering_2, type="l", col="red"))
with(plot3, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend('topright', col=c('black', 'red', 'blue'),lty=1, legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


##global reactive power

data1$Global_reactive_power<-as.numeric(as.character(data1$Global_reactive_power))

with(data1, plot(DateTime, Global_reactive_power, ylab="datetime", type='l'))
##end here
dev.off()

