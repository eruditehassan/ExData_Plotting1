plot1 <- function(){
    # Loading the dataset
    hpc <- read.table("./household_power_consumption.txt", sep = ";", dec = ".", header = T)
    # Converting Date column from character to Date format
    hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
    # Subsetting required dataset
    hpc_subset <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02") 
    # Converting Globa_active_power to numeric
    hpc_subset$Global_active_power <- as.numeric(hpc_subset$Global_active_power)
    # Creating png graphics device to export the plot
    png("plot1.png", width = 480, height = 480)
    # Plotting a histogram
    hist(hpc_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col = 'red')
    # Closing the graphics device
    dev.off()
}