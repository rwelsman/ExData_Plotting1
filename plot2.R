library(dplyr)

# Read the source data
power_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings=c("?"))
power_data <- mutate(power_data,datetime = as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S",tz="UTC")))
power_data <- select(power_data,3:10)
power_data <- filter(power_data,datetime >= as.POSIXct("2007-02-01 00:00:00", tz="UTC")
                              & datetime < as.POSIXct("2007-02-03 00:00:00", tz="UTC"))

# Create plot #2
png("plot2.png")
plot(power_data$datetime,power_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()