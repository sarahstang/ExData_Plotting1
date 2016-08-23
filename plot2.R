## Getting full dataset
hpc <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
## Subsetting the data
hpcsubset <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(hpcsubset$Date), hpcsubset$Time)
hpcsubset$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(hpcsubset$Global_active_power~hpcsubset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()