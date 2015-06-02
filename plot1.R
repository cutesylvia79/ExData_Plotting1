a <- read.table("household_power_consumption.txt", sep=";",comment.char="",header=TRUE, stringAsFactors=FALSE)
a1 <- a[a$Date >="2007-02-01" & a$Date<="2007-02-02", ]

aDate1 <- strptime(a1$Date, "%d/%m/%Y")

a1$Date <-aDate1

a1<- within(a1, { timestamp=format(as.POSIXct(paste(Date, Time)), "%Y-%m-%d %H:%M:%S") })

a1$Voltage <-as.numeric(a1$Voltage)
a1$Global_active_power <-as.numeric(a1$Global_active_power)
a1$Global_reactive_power <-as.numeric(a1$Global_reactive_power)

hist(a1$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")



axis.Date(1, at = seq(d[1], d[100], length.out=25),
        labels = seq(d[1], d[100], length.out=25),
        format= "%m/%d/%Y", las = 2)


plot(a1$Global_active_power~weekday(a1$timestamp),type="l",
     xlab="Date",ylab="power")