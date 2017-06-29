df <- read.table("../household_power_consumption.txt", header=TRUE, sep=';',na.strings = "?")
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
df1$DateTime <- strptime(paste(df1$Date, df1$Time),"%d/%m/%Y %H:%M:%S")
plot(df1$DateTime, df1$Global_active_power,type='l',ylab="Global Active Power (kilowatts)", xlab ="")
dev.print(png, file = "plot2.png", width = 480, height = 480)
dev.off()