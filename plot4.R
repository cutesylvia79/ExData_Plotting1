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
ydata1 <- data$Sub_metering_1
ydata2 <- data$Sub_metering_2
ydata3 <- data$Sub_metering_3


if (length(dev.list()) == 0) { dev.new() }

dev.copy(png, file = "Plot4.png", width = 480, height = 480)

plot.new()
##par(omi=c(0,0,1,0) )                      #set the size of the outer margins 
par(mfrow=c(2,2))                        #number of rows and columns to graph

yvoltage <- data$Voltage
yReactive <- data$Global_reactive_power
  
  
## plot first graph - Active Power
plot(xdata,ydata,type="l",ylab="Global Active Power(kilowatts)", xlab="")

## plot second graph - Voltage
plot(xdata,yvoltage,type="l",ylab="Voltage", xlab="datetime")

## plot sub-metering graph
##plot(x=xdata,y=ydata1,type="n",xlab="",ylab="Energy Sub-metering")
##lines(xdata,ydata1,col="black",type="l")
plot(xdata,ydata1,col="black",type="l",xlab="",ylab="Energy Sub-metering")
lines(xdata,ydata2,col="red",type="l")
lines(xdata,ydata3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= c(1,1,1), bty='n', cex=0.8,col=c("black","red","blue"))



## plot last graph - Voltage
plot(xdata,yReactive,type="l",ylab="Global_reactive_power", xlab="datetime")

dev.off()

