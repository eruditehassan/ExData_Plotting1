library(dplyr)
plot2 <- function(){
    # Loading the dataset
    hpc <- read.table("./household_power_consumption.txt", sep = ";", dec = ".", header = T)
    # Converting Date column from character to Date format
    hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
    # Subsetting required dataset
    hpc_subset <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02") 
    # Converting Globa_active_power to numeric
    hpc_subset$Global_active_power <- as.numeric(hpc_subset$Global_active_power)
    # Adding a new column "Date_Time" combining Date and Time columns
    hpc_subset <- mutate(hpc_subset, Date_Time = paste(Date,Time))
    # Converting this column to POSIXct format
    hpc_subset$Date_Time = as.POSIXct(hpc_subset$Date_Time,fomat = "%Y-%m-%d %H:%M:%S", tz = "Etc/GMT-7")
    # Creating a png graphics device
    png("plot2.png", width = 480, height = 480)
    # plotting the required plot
    plot(hpc_subset$Date_Time,hpc_subset$Global_active_power, type = 'l',xlab = "", ylab = "Global Active Power (kilowatts)")
    # Closing the graphics device
    dev.off()
}