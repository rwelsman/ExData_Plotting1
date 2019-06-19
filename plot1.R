library(dplyr)

# Read the source data
power_data <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings=c("?"))
power_data <- mutate(power_data,datetime = as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S",tz="UTC")))
power_data <- select(power_data,3:10)
power_data <- filter(power_data,datetime >= as.POSIXct("2007-02-01 00:00:00", tz="UTC")
                              & datetime < as.POSIXct("2007-02-03 00:00:00", tz="UTC"))

# Create plot #1
png("plot1.png")
hist(power_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()