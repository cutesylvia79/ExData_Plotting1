xdata <- a1$timestamp
xdata <- as.POSIXct(xdata)
x_range <-range(xdata)
ydata1 <- a1$Sub_metering_1
ydata2 <- a1$Sub_metering_2
ydata3 <- a1$Sub_metering_3


plot(x=xdata,y=ydata1,type="n",xlab="",ylab="Energy Sub-metering")
lines(xdata,ydata1,col="black",type="l")
lines(xdata,ydata2,col="red",type="l")
lines(xdata,ydata3,col="blue",type="l")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= c(1,1,1), lwd= c(1.5,1.5,1.5),col=c("black","red","blue"))