# Import dataset
library(readr)
DT <- read_delim("~/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
library(data.table)
DT <- as.data.table(DT)

# Convert to date format
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

## 2-day subset
Data_2_days <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02" ]

#Create png file
png(file="plot1.png")

#Create histogram - no axes
x.hist <- hist(Data_2_days$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
 
dev.off()
