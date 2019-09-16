library(dplyr)
library(lubridate)
library(tidyr)
par(mfrow=c(1,1))
data1<-read.table('Course4/household_power_consumption.txt', sep=';', header=TRUE)


#2007-02-01 and 2007-02-02
data1$Date<-dmy(data1$Date)
data1<-data1%>%
  filter(Date>=as.Date("2007-02-01"))%>%
  filter(Date<=as.Date("2007-02-02"))

##plot1
png("plot2.png", width = 480, height = 480)
##plot2

data1$DateTime<-paste(data1$Date, data1$Time)
data1$DateTime<-ymd_hms(data1$DateTime)

with(data1, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Globla Active Power (kilowatts)"))

dev.off()