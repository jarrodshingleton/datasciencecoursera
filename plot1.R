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
png("plot1.png", width = 480, height = 480)


data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

hist(data1$Global_active_power, col="red", main="Global Active Power",
     xlab="Globla Active Power (kilowatts)")

dev.off()