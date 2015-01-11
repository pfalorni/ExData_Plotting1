# The dataset dates (first field) are in sorted order ==>  dates from 2007-02-01 to 2007-02-02 are all packed in rows from 66638 to 69517
D <- as.data.frame(read.table('household_power_consumption.txt', sep=';', na.strings="?", stringsAsFactors=FALSE, skip=66638-1, nrows=69517-(66638-1)))

# Build a DATE column to make plotting of X axis easier
D$DateTime <- strptime(paste(D[,1],D[,2]), "%d/%m/%Y %H:%M:%S")

# Remane columns for clarity
colnames(D) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3","date_time")

# Plot histogram to PNG file
png(filename="plot1.png",width=480, height=480)
with(D, hist(global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.off()
