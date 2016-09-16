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
TimeLine<-strptime(paste(PowerCon1$Date, PowerCon1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(TimeLine,as.numeric(PowerCon1$Global_active_power),type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
