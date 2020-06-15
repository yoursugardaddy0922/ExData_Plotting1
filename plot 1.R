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
#close the device
dev.off()