df <- read.table("../household_power_consumption.txt", header=TRUE, sep=';',na.strings = "?")
df1 <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
hist(df1$Global_active_power, main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)', ylim=range(0,1200), xlim=range(0,6))
dev.print(png, file = "plot1.png", width = 480, height = 480)