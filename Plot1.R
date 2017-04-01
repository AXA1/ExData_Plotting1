# File import
DT <- read_delim("~/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
summary(DT$Global_active_power)

#Create png file
png(file="plot1.png")

#Create histogram - no axes#Create histogram - no axes
x.hist <- hist(DT$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)",axes=FALSE)
 
# create new axes
# draw axis along 'y' - rescaled labels
axis(2, at=axTicks(2), labels=paste(axTicks(2)/1000,sep=""), cex.axis=0.8)

# draw axis along 'x'
axis(1)
dev.off()
