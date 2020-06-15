#download and unzip the file
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile ="C:/Users/123/Desktop/data/power.zip")
power<-unzip("C:/Users/123/Desktop/data/power.zip",exdir = "C:/Users/123/Desktop/data")
#read data from the dates 2007-02-01 and 2007-02-02
file<-file("C:/Users/123/Desktop/data/power/household_power_consumption.txt")
power_data<-read.table(text = grep("^[1,2]/2/2007",readLines(file),value=TRUE),na.strings = "?",sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot 1
##creating a png file named plot1
png(filename ="C:/Users/123/Desktop/plot/plot1.png",width = 480,height = 480,units = "px" )
##plotting 
hist(power_data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main="Global Active Power")
dev.off()

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
