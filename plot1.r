# read data
file <- "household_power_consumption.txt"

# read in full dataset
data <- read.table(file,header=T,sep=";",na.strings="?")

#change to date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset dates 2007-02-01 and 2007-02-02
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

#create histogram
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#copy and save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()