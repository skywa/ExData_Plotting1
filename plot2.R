#Read in data from 2007/2/1 to 2007/2/2 (text file processed manually)

data <- read.csv("C:/Users/swaye/Desktop/mooc/Coursera/4_Exploratory_Data_Analysis/Course Project 1/household_power_consumption_cut.txt", sep=";", na.strings="?")

#Combine date and time columns and format
data$DateTime <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

#Open PNG device
png(file = "plot2.png", width = 480, height = 480)

#Plot time series of Global Active Power
plot(data$DateTime,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")

#Close PNG device
dev.off()