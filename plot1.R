hpc_orig <- read.table(file="household_power_consumption.txt", 
                       header=TRUE, sep=";", na.strings = "?",
                       stringsAsFactors = FALSE)
hpc <- subset(hpc_orig,
              subset = ((Date == "1/2/2007") | (Date == "2/2/2007")))

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time),
                           format="%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480)
with(hpc, hist(Global_active_power, col="red",
               main="Global Active Power",
               xlab="Global Active Power (kilowatts)"))
dev.off()