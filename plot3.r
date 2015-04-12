# read data
file <- "household_power_consumption.txt"

# read in full dataset
data <- read.table(file,header=T,sep=";",na.strings="?")

#change to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset dates 2007-02-01 and 2007-02-02
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# convert date and time together
data$datetime <- paste(data$Date,data$Time)
data$datetime <- strptime(data$datetime, "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

#create plot
plot(data$Sub_metering_1~data$datetime, type="l",
     ylab="Energy sub metering", xlab="")
lines(data$Sub_metering_2~data$datetime, col='Red')
lines(data$Sub_metering_3~data$datetime, col='Blue')

#add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("Black","Red","Blue"), lty=1 )

#copy and save
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()