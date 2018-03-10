


data<- read.delim("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE, na.strings = "?"  )

data$Date<- as.Date(data$Date,"%d/%m/%Y")


subset<- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

subset$date_time<-strptime(paste(subset$Date,subset$Time), '%Y-%m-%d %H:%M:%S')

cols<- c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2" ,"Sub_metering_3")

subset[cols]<- lapply(subset[cols],as.numeric)

png(filename = "plot4.png",width = 480,height = 480)

# Golbal active power plot
par(mfrow =c(2,2),family ="serif")
plot(subset$Global_active_power,type = "n",xaxt = "n",ylab = "Global Active Power (Kilowatts)", xlab = "")
lines(subset$Global_active_power )
axis(1,at = c(0,1500,2880),lab = c("Thu","Fri","Sat"))

# voltage plot

plot(subset$date_time,subset$Voltage,type = "n", ylab = "Voltage",xlab = "datetime")
lines(subset$date_time,subset$Voltage)

#Sub metering plot

plot(subset$date_time,subset$Sub_metering_1, type = "n", xlab = "",ylab = "Energy sub metering")
lines(subset$date_time,subset$Sub_metering_1,col = "black")
lines(subset$date_time,subset$Sub_metering_2,col = "red")
lines(subset$date_time,subset$Sub_metering_3,col = "blue")
legend("topright",  lty = 1,lwd = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

# Golbal reactive power plot
plot(subset$date_time, subset$Global_reactive_power, type = "n", xlab = "datetime")
lines(subset$date_time, subset$Global_reactive_power)


dev.off()
