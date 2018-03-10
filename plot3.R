

data<- read.delim("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE, na.strings = "?")

data$Date<- as.Date(data$Date,"%d/%m/%Y")


subset<- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

subset$date_time<-strptime(paste(subset$Date,subset$Time), '%Y-%m-%d %H:%M:%S')

cols<- c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2" ,"Sub_metering_3")

subset[cols]<- lapply(subset[cols],as.numeric)

png(filename = "plot3.png",width = 480,height = 480) 

plot(subset$date_time,subset$Sub_metering_1, type = "n", xlab = "",ylab = "Energy sub metering")
lines(subset$date_time,subset$Sub_metering_1,col = "black")
lines(subset$date_time,subset$Sub_metering_2,col = "red")
lines(subset$date_time,subset$Sub_metering_3,col = "blue")
legend("topright",cex = 1.5, lty = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



dev.off()

