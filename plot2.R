data<-read.table('household_power_consumption.txt', header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date<-as.Date(data$Date,format = '%d/%m/%Y')

work<-subset(data,subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

data2 <- paste(as.Date(work$Date), work$Time)
work$Datetime <- as.POSIXct(data2)

plot(work$Global_active_power~work$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()