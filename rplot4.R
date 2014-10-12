filename = "household_power_consumption.txt"
if(!exists("table")){
  table = read.table(filename, sep = ";", na.strings="?", header=TRUE)
  table$DNT = strptime(paste(table$Date, table$Time), 
                       format="%d/%m/%Y %H:%M:%S")
}
if(!exists("Feb01"))
  Feb01 = table[table$Date=="1/2/2007",]
if(!exists("Feb02"))
  Feb02 = table[table$Date=="2/2/2007",]

Plot4Data = rbind(Feb01, Feb02)

##plot4.png
png("plot4.png", bg="transparent")
par(mfrow=c(2,2))

#Upper left graph
plot(Plot4Data$DNT, Plot4Data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power(kilowatts)")

#2Upper right graph
plot(Plot4Data$DNT, Plot4Data$Voltage,type="l", xlab="datetime", ylab="Voltage")

#3Lower left graph
plot(Plot3Data$DNT, Plot3Data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
with(Plot3Data, lines(DNT, Sub_metering_2, col="red"))
with(Plot3Data, lines(DNT, Sub_metering_3, col="blue"))
legend("topright", bty="n", lty="solid", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4Lower right graph
plot(Plot4Data$DNT, Plot4Data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()