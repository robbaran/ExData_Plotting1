df <- read.table("../household_power_consumption.txt", header=TRUE, sep=';',na.strings = "?")
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
df1$DateTime <- strptime(paste(df1$Date, df1$Time),"%d/%m/%Y %H:%M:%S")
plot(df1$DateTime, df1$Sub_metering_1,type ='l',col="black", xlab = "", ylab="Energy sub metering")
lines(df1$DateTime, df1$Sub_metering_2,col="red")
lines(df1$DateTime, df1$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lt=1)
dev.print(png, file = "plot3.png", width = 480, height = 480)
dev.off()