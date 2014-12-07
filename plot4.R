hpc_orig <- read.table(file="household_power_consumption.txt", 
                       header=TRUE, sep=";", na.strings = "?",
                       stringsAsFactors = FALSE)
hpc <- subset(hpc_orig,
              subset = ((Date == "1/2/2007") | (Date == "2/2/2007")))

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time),
                           format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(hpc, plot(DateTime, Global_active_power, type="l", xlab="",
               ylab="Global Active Power"))
with(hpc, plot(DateTime, Voltage, type="l", xlab="datetime"))
with(hpc, plot(DateTime, Sub_metering_1, type="l", xlab="",
               ylab="Energy sub metering"))
with(hpc, points(x=DateTime, y=Sub_metering_2, type="l", col="red"))
with(hpc, points(x=DateTime, y=Sub_metering_3, type="l", col="blue"))
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))
with(hpc, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))
dev.off()