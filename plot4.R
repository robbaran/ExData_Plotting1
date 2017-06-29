df <- read.table("../household_power_consumption.txt", header=TRUE, sep=';',na.strings = "?")
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
df1$DateTime <- strptime(paste(df1$Date, df1$Time),"%d/%m/%Y %H:%M:%S")

par(mar=c(4.0,4.1,1.1,2.1), mfcol=c(2,2))

#top-left plot
plot(df1$DateTime, df1$Global_active_power,ylim=range(0,6),type='l',ylab="Global Active Power", xlab ="")

#bottom-left plot
plot(df1$DateTime, df1$Sub_metering_1,type ='l',col="black", xlab = "", ylab="Energy sub metering")
lines(df1$DateTime, df1$Sub_metering_2,col="red")
lines(df1$DateTime, df1$Sub_metering_3,col="blue")
legend("topright", cex = 0.95,bty ="n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lt=1)

#top-right plot
plot(df1$DateTime, df1$Voltage,type='l',ylab="Voltage", xlab ="datetime")

#bottom-right plot
plot(df1$DateTime, df1$Global_reactive_power,type='l',ylab="Global_reactive_power", xlab ="datetime")

dev.print(png, file = "plot4.png", width = 480, height = 480)
dev.off()