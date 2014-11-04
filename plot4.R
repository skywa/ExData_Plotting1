#Read in data from 2007/2/1 to 2007/2/2 (text file processed manually)

data <- read.csv("C:/Users/swaye/Desktop/mooc/Coursera/4_Exploratory_Data_Analysis/Course Project 1/household_power_consumption_cut.txt", sep=";", na.strings="?")

#Combine date and time columns and format
data$DateTime <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

#Open PNG device
png(file = "plot4.png", width = 480, height = 480)

#Plot 4 plots of Global active power time series, voltage, energy sub-metering 1, 2, and 3, and Global reactive power

par(mfrow = c(2, 2))

with(data, {
      #Global active power plot
      plot(data$DateTime, data$Global_active_power, type = "l", xlab = "",
           ylab = "Global Active Power (kilowatts)", main = "")
      
      #Voltage plot
      plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime",
           ylab = "Voltage", main = "")
      
      #Energy sub-metering plots
      with(data, {
            plot(data$DateTime, data$Sub_metering_1, main="", type = "l", 
                 col = "black", xlab = "", ylab = "Energy sub metering")
            lines(data$DateTime, data$Sub_metering_2, main="", type = "l", 
                 col = "red")
            lines(data$DateTime, data$Sub_metering_3, main="", type = "l", 
                 col = "blue")})
      legend("topright", lwd=1, lty=c(1,1,1), col = c("black", "red","blue"),
             bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", 
                                   "Sub_metering_3"))
      
      #Global reactive power plot
      plot(data$DateTime, data$Global_reactive_power, type = "l", 
           xlab = "datetime", ylab = "Global_reactive_power", main = "")
            })

#Close PNG device
dev.off()