#Read in data from 2007/2/1 to 2007/2/2 (text file processed manually)

data <- read.csv("C:/Users/swaye/Desktop/mooc/Coursera/4_Exploratory_Data_Analysis/Course Project 1/household_power_consumption_cut.txt", sep=";", na.strings="?")

#Combine date and time columns and format
data$DateTime <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

#Open PNG device
png(file = "plot3.png", width = 480, height = 480)

#Plot lines of energy sub-metering 1, 2, and 3
with(data, {
      plot(data$DateTime, data$Sub_metering_1, main="", type = "l", 
           col = "black", xlab = "", ylab = "Energy sub metering")
      lines(data$DateTime, data$Sub_metering_2, main="", type = "l", 
           col = "red")
      lines(data$DateTime, data$Sub_metering_3, main="", type = "l", 
           col = "blue")})
legend("topright", lwd=1, lty=c(1,1,1), col = c("black", "red" ,"blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     

#Close PNG device
dev.off()