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

Plot3Data = rbind(Feb01, Feb02)

##plot3.png
png("plot3.png", bg="transparent")
plot(Plot3Data$DNT, Plot3Data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
with(Plot3Data, lines(DNT, Sub_metering_2, col="red"))
with(Plot3Data, lines(DNT, Sub_metering_3, col="blue"))
legend("topright", lty="solid", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()