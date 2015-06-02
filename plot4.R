plot.new()
par(omi=c(0,0,1,0) )                      #set the size of the outer margins 
par(mfrow=c(2,2))                        #number of rows and columns to graph

yvoltage <- a1$Voltage
yReactive <- a1$Global_reactive_power
  
  
## plot first graph - Active Power
plot(xdata,ydata,type="l",ylab="Global Active Power(kilowatts)", xlab="")

## plot second graph - Voltage
plot(xdata,yvoltage,type="l",ylab="Voltage", xlab="datetime")

## plot sub-metering graph
plot(x=xdata,y=ydata1,type="n",xlab="",ylab="Energy Sub-metering")
lines(xdata,ydata1,col="black",type="l")
lines(xdata,ydata2,col="red",type="l")
lines(xdata,ydata3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lwd = 0,box.col = "white",bg="white", lty= c(1,1,1), lwd= c(1.5,1.5,1.5),col=c("black","red","blue"))



## plot last graph - Voltage
plot(xdata,yReactive,type="l",ylab="Global_reactive_power", xlab="datetime")

