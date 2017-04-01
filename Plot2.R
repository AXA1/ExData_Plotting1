## Import dataset
library(readr)
DT <- read_delim("~/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
library(data.table)
DT <- as.data.table(DT)

# Convert to date format
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## 2-day subset
Data_2_days <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02" ]

## Conver date + time
Date_Time <- paste(as.Date(Data_2_days$Date), Data_2_days$Time)
Data_2_days$Datetime <- as.POSIXct(Date_Time)

## Plot 2
png(file="plot2.png", height=480, width=480)
plot(Data_2_days$Datetime,Data_2_days$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
