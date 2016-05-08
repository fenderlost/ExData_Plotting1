## upload data from household_power_comsuption.txt file to a data.frame using header as columns name and "?" as NA value
info <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
## Subset the data to get just the range to be used
info<-info[info$Date=="1/2/2007"|info$Date=="2/2/2007",]
## adjust de size of the graphic device and the margins
par(mar=c(4,4,2,2),mfrow=c(1,1))
## Generate histogram and sets labels, title and color in the screen device
hist(info$Global_active_power,col="red",xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
## Prepares to write a PNG file
dev.copy(png,file="plot1.png",width = 480, height = 480)
## Generate histogram and sets labels, title and color in the PNG device
hist(info$Global_active_power,col="red",xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
## Close PNG device
dev.off()








