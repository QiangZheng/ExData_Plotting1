data <- read.table("household_power_consumption.txt",header = T, sep = ";", skip = 66636,nrows = 2880)

data_name <- read.table("household_power_consumption.txt",header = T,sep=";",nrows =1)

names(data) <- names(data_name)

rm(data_name)

data$Date_Time <- paste(data$Date,data$Time)

data$Date_Time <- strptime(data$Date_Time, "%d/%m/%Y %H:%M:%S")

# as.Date(data$Date,"%d/%m/%Y")
#weekdays <- weekdays(as.Date(data$Date,"%d/%m/%Y"),abbreviate = T)
#weekdays <- weekdays[!duplicated(weekdays)]

png(file = "plot2.png",width=480,height=480,units="px")

plot(data$Date_Time,data$Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)",type="l")

dev.off()