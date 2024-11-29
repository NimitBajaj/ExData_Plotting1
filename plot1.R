library(data.table)

# Path to the dataset
file <- "C:/Users/nimit/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt"

# Read and subset the data
data <- fread(file, na.strings = "?", sep = ";")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert Date and Time to DateTime
data[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Create Plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")