library(dplyr)

# Read the source data
power_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings=c("?"))
power_data <- mutate(power_data,datetime = as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S",tz="UTC")))
power_data <- select(power_data,3:10)
power_data <- filter(power_data,datetime >= as.POSIXct("2007-02-01 00:00:00", tz="UTC")
                              & datetime < as.POSIXct("2007-02-03 00:00:00", tz="UTC"))

# Create plot 3
png("plot3.png")
plot(power_data$datetime,power_data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(power_data$datetime,power_data$Sub_metering_2,col="red")
lines(power_data$datetime,power_data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()