## Get dataset

hpc <- read.csv("~/Desktop/Project 1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## Subset the data

hpcsubset <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Convert dates

datetime <- paste(as.Date(hpcsubset$Date), hpcsubset$Time)
hpcsubset$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(hpcsubset$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()