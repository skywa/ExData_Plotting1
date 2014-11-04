#Read in data from 2007/2/1 to 2007/2/2 (text file processed manually)

data <- read.csv("C:/Users/swaye/Desktop/mooc/Coursera/4_Exploratory_Data_Analysis/Course Project 1/household_power_consumption_cut.txt", sep=";", na.strings="?")

#Open PNG device
png(file = "~\\plot1.png", width = 480, height = 480)

#Plot histogram of Global Active Power
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Close PNG device
dev.off()