## upload data from household_power_comsuption.txt file to a data.frame using header as columns name and "?" as NA value
info <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
## Subset the data to get just the range to be used
info<-info[info$Date=="1/2/2007"|info$Date=="2/2/2007",]
## adjust de size of the graphic device and the margins
par(mar=c(4,4,2,2),mfrow=c(1,1))
## Converts the columns Date and Time in one only columnd named fullDate
info$fullDate <- paste(info$Date,info$Time)
info$fullDate <- as.POSIXct(strptime(info$fullDate,"%d/%m/%Y %H:%M:%S"))
## Generate graphic and sets labels, title and color in the Screen device
plot(info$fullDate,info$Global_active_power,type ="l",xlab = "",ylab = "Global Active Power (kilowatts)",col="black")
## Prepares to write a PNG file
dev.copy(png,file="plot2.png",width = 480, height = 480)
## Generate graphic and sets labels, title and color in the PNG device
plot(info$fullDate,info$Global_active_power,type ="l",xlab = "",ylab = "Global Active Power (kilowatts)",col="black")
## Close PNG device
dev.off()