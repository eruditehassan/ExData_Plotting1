plot4 <- function(){
    # Loading the dataset
    hpc <- read.table("./household_power_consumption.txt", sep = ";", dec = ".", header = T)
    # Converting Date column from character to Date format
    hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
    # Subsetting required dataset
    hpc_subset <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
    # Adding a new column "Date_Time" combining Date and Time columns
    hpc_subset <- mutate(hpc_subset, Date_Time = paste(Date,Time))
    # Converting this column to POSIXct format
    hpc_subset$Date_Time = as.POSIXct(hpc_subset$Date_Time,fomat = "%Y-%m-%d %H:%M:%S", tz = "Etc/GMT-7")
    # Creating a png graphics device
    png("plot4.png", width = 480, height = 480)
    # setting the graphic so that it has 2 rows and 2 columns, so a total of 4 plots can be plotted
    par(mfrow = c(2,2))
    # Plot5ing first plot
    plot(hpc_subset$Date_Time,hpc_subset$Global_active_power, type = 'l',xlab = "", ylab = "Global Active Power (kilowatts)")
    # Plotting second plot
    plot(hpc_subset$Date_Time,hpc_subset$Voltage, type = 'l',xlab = "datetime", ylab = "Voltage")
    # Plotting third plot
    plot(hpc_subset$Date_Time, hpc_subset$Sub_metering_1, type = 'l', xlab = "", ylab="Energy sub metering")
    lines(hpc_subset$Date_Time, hpc_subset$Sub_metering_2, col = "red")
    lines(hpc_subset$Date_Time, hpc_subset$Sub_metering_3, col = "blue")
    legend("topright", legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), col = c("black","red","blue"),lty=1, bty = 'n')
    # Plotting fourth plot
    plot(hpc_subset$Date_Time,hpc_subset$Global_reactive_power, type = 'l',xlab = "datetime", ylab = "Global_reactive_power")
    # Closing a png graphics device
    dev.off()
}