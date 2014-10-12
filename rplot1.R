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
Plot1Data = rbind(Feb01, Feb02)

#plot1.png
png("plot1.png", bg="transparent")
hist(Plot1Data$Global_active_power, col = "red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()