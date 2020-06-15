#plot 2
##Converting date and time variables
power_data$Date <- as.Date(power_data$Date, format = '%d/%m/%Y')
power_data$DateTime <- as.POSIXct(paste(power_data$Date, power_data$Time))
Sys.setlocale(category = "LC_ALL", locale = "english")

#creating a png file named plot2
png(filename = "C:/Users/123/Desktop/plot/plot2.png",width = 480,height = 480,units = "px")
#plotting
plot(power_data$DateTime,power_data$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatt)",type="l")
#close the device
dev.off()