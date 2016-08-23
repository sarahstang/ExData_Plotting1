## Get dataset
hpc <- read.csv("~/Desktop/Project 1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Subset the data

hpcsubset <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates
datetime <- paste(as.Date(hpcsubset$Date), hpcsubset$Time)
hpcsubset$Datetime <- as.POSIXct(datetime)

## Plot 3
with(hpcsubset, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save as png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()