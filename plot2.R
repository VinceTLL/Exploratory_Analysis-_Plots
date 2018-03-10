



data<- read.delim("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE, na.strings = "?")

data$Date<- as.Date(data$Date,"%d/%m/%Y")

subset<- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

subset$date_time<-strptime(paste(subset$Date,subset$Time), '%Y-%m-%d %H:%M:%S')

subset$Global_active_power<-as.numeric(subset$Global_active_power)


png(filename = "plot2.png",width = 480,height = 480)

plot(subset$date_time,subset$Global_active_power,type = "n",ylab = "Global Active Power (Kilowatts)", xlab = "")
lines(subset$date_time,subset$Global_active_power )



dev.off()



