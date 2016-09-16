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

PowSubM1<-data.frame(TimeLine,as.numeric(PowerCon1$Sub_metering_1))
PowSubM2<-data.frame(TimeLine,as.numeric(PowerCon1$Sub_metering_2))
PowSubM3<-data.frame(TimeLine,as.numeric(PowerCon1$Sub_metering_3))
colnames(PowSubM1) <-c("TimeLine","S1")
colnames(PowSubM2) <-c("TimeLine","S2")
colnames(PowSubM3) <-c("TimeLine","S3")

png("plot3.png", width=480, height=480)
plot(PowSubM1$TimeLine,PowSubM1$S1,type="l", xlab="", ylab="Energy Submetering")
lines(PowSubM2$TimeLine,PowSubM2$S2,type = "l",col='red')
lines(PowSubM3$TimeLine,PowSubM3$S3,type = "l",col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,col=c("black", "red", "blue"))
dev.off()


