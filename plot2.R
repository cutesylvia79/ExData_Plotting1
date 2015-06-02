xdata <- a1$timestamp
xdata <- as.POSIXct(xdata)
x_range <-range(xdata)
ydata <- a1$Global_active_power


plot(xdata,ydata,type="l",ylab="Global Active Power(kilowatts)", xlab="")
