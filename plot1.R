


data<- read.delim("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

data$Date<- as.Date(data$Date,"%d/%m/%Y")

subset<- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

subset$Global_active_power<-as.numeric(subset$Global_active_power)

png(filename = "plot1.png",width = 480,height = 480)

hist(subset$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power (Kilowatts)")

dev.off()







