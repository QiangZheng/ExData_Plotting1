data <- read.table("household_power_consumption.txt",header = T, sep = ";", skip = 66636,nrows = 2880)

data_name <- read.table("household_power_consumption.txt",header = T,sep=";",nrows =1)

names(data) <- names(data_name)

rm(data_name)

data$Date_Time <- paste(data$Date,data$Time)

data$Date_Time <- strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png",width=480,height=480,units="px")

plot(data$Date_Time,data$Sub_metering_1,xlab = "", ylab = "Energy sub metering",type="l")
lines(data$Date_Time,data$Sub_metering_2,col="red")
lines(data$Date_Time,data$Sub_metering_3,col="blue")

legend("topright",col =c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

dev.off()