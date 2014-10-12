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

Plot2Data = rbind(Feb01, Feb02)

#plot2.png
png("plot2.png", bg="transparent")
##In case your compute's language is not set to English
Sys.setlocale("LC_TIME","ENGLISH")
plot(Plot2Data$DNT, Plot2Data$Global_active_power, 
     xlab="", ylab="Global Active Power(kilowatts)", type="l")
dev.off()