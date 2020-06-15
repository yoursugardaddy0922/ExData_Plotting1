#plot 3
Sys.setlocale(category = "LC_ALL", locale = "english")
#creating a png file called plot3
png(filename = "C:/Users/123/Desktop/plot/plot3.png",width = 480,height = 480,units = "px")
plot(power_data$DateTime,power_data$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "l")
lines(power_data$DateTime,power_data$Sub_metering_2,col="red")
lines(power_data$DateTime,power_data$Sub_metering_3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_meterimg_3"))
#close the device
dev.off()  