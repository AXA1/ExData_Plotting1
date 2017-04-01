## Import dataset
library(readr)
DT <- read_delim("~/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
library(data.table)
DT <- as.data.table(DT)

# Convert to date format
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## 2-day subset
Data_2_days <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02"]

## Conver date + time
Date_Time <- paste(as.Date(Data_2_days$Date), Data_2_days$Time)
Data_2_days$Datetime <- as.POSIXct(Date_Time)

# Plot 4
png(file="plot4.png")
Sys.setlocale(category = "LC_ALL", locale = "english")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(Data_2_days$Datetime,Data_2_days$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(Data_2_days$Datetime, Data_2_days$Voltage,  type="l", xlab = "datetime", ylab = "Voltage")

plot(Data_2_days$Datetime, Data_2_days$Sub_metering_1, type = "l", xlab = "", ylab = "'Energy sub metering")
lines(Data_2_days$Datetime, Data_2_days$Sub_metering_2, col = "Red")
lines(Data_2_days$Datetime, Data_2_days$Sub_metering_3, col = "Blue")
legend("topright", lty=1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n", cex=0.8)

plot(Data_2_days$Datetime, Data_2_days$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()

