data <- read.table("household_power_consumption.txt",header = T, sep = ";", skip = 66636,nrows = 2880)

data_name <- read.table("household_power_consumption.txt",header = T,sep=";",nrows =1)

names(data) <- names(data_name)

rm(data_name)

png(file = "plot1.png",width=480,height=480,units="px")

hist(data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col="red")

dev.off()
