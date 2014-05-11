data <- read.table("household_power_consumption.txt",header = T, sep = ";", skip = 66636,nrows = 2880)

data_name <- read.table("household_power_consumption.txt",header = T,sep=";",nrows =1)

names(data) <- names(data_name)

rm(data_name)

data$Date_Time <- paste(data$Date,data$Time)

data$Date_Time <- strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png",width=480,height=480,units="px")

par(mfrow = c(2,2))

with(data,{
  
    plot(Date_Time,Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)",type="l")
    plot(Date_Time,Voltage,xlab = "datetime", ylab = "Voltage",type="l")
    plot(data$Date_Time,data$Sub_metering_1,xlab = "", ylab = "Energy sub metering",type="l")
    lines(data$Date_Time,data$Sub_metering_2,col="red")
    lines(data$Date_Time,data$Sub_metering_3,col="blue")    
    legend("topright",col =c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,inset=0.005,box.lwd=0)
    plot(Date_Time,Global_reactive_power,xlab = "datetime", ylab = "Global_reactive_power",type="l")
  
})

dev.off()
