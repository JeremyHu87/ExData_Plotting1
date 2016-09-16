filename <- "Assignment_dataset.zip"

# Download dataset:
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip "
        download.file(fileURL, destfile=filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

PowerCon<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)
PowerCon1 <-PowerCon[PowerCon$Date %in% c("1/2/2007","2/2/2007") ,]
GAPower <-as.numeric(PowerCon1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()