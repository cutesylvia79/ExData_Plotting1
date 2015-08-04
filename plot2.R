if (!file.exists("household_power_consumption.txt"))
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")


colNames = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
             "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
a <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ';', na.strings="?", col.names = colNames)


aDate1 <- strptime(a$Date, "%d/%m/%Y")
a$Date <-aDate1

data<- within(a, { timestamp=format(as.POSIXct(paste(Date, Time)), "%Y-%m-%d %H:%M:%S") })

data$Voltage <-as.numeric(data$Voltage)
data$Global_active_power <-as.numeric(data$Global_active_power)
data$Global_reactive_power <-as.numeric(data$Global_reactive_power)

xdata <- data$timestamp
xdata <- as.POSIXct(xdata)
x_range <-range(xdata)
ydata <- data$Global_active_power

if (length(dev.list()) == 0) { dev.new() }
dev.copy(png, file = "Plot2.png", width = 480, height = 480)
plot(xdata,ydata,type="l",ylab="Global Active Power(kilowatts)", xlab="")
dev.off()

