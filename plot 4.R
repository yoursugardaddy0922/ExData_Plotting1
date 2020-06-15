#plot 4
Sys.setlocale(category = "LC_ALL", locale = "english")
#creating a png file called plot4
png(filename = "C:/Users/123/Desktop/plot/plot4.png",width = 480,height = 480,units = "px")
par(mfrow=c(2,2))
#the topleft graph
plot(power_data$DateTime,power_data$Global_active_power,xlab = "",ylab = "Global Active Power",type = "l")
#the topright graph
plot(power_data$DateTime,power_data$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
#The bottom left graph
plot(power_data$DateTime,power_data$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "l")
lines(power_data$DateTime,power_data$Sub_metering_2,col="red")
lines(power_data$DateTime,power_data$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_meterimg_3"))
#The bottom right graph
plot(power_data$DateTime,power_data$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
#close the device
dev.off()
