# The dataset dates (first field) are in sorted order ==>  dates from 2007-02-01 to 2007-02-02 are all packed in rows from 66638 to 69517
D <- as.data.frame(read.table('household_power_consumption.txt', sep=';', na.strings="?", stringsAsFactors=FALSE, skip=66638-1, nrows=69517-(66638-1)))

# Build a DATE column to make plotting of X axis easier
D$DateTime <- strptime(paste(D[,1],D[,2]), "%d/%m/%Y %H:%M:%S")

# Remane columns for clarity
colnames(D) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3","date_time")


# Plot diagram to PNG file
png(filename="plot4.png",width=480, height=480)
par(mfcol=c(2,2))
with(D, plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(D, plot(date_time, sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(D, lines(date_time, sub_metering_1, col="black"))
with(D, lines(date_time, sub_metering_2, col="red"))
with(D, lines(date_time, sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
with(D, plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage"))
with(D, plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
