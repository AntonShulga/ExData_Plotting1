## This script is creating a Plot#3 for a Course Project #1 of Exploratory 
## Data Analysis course of Coursera. 

drawChart3 <- function() {
        
        ## read data from file 
        UCdata <- read.table("../../Data/household_power_consumption.txt",
                             header = TRUE, sep = ";", na.strings = "?",
                             comment.char = "", stringsAsFactors = FALSE,
                             skip = 66636, nrows = 69517-66637)
        colnames(UCdata) <- colnames(read.table("../../Data/household_power_consumption.txt",
                                                header = TRUE, sep = ";", 
                                                na.strings = "?",
                                                comment.char = "", 
                                                stringsAsFactors = FALSE,
                                                nrows = 2))
        
        ## convert first two columns into date and time
        UCdata$Time <- strptime(paste(UCdata$Date, " ", UCdata$Time), 
                                format = "%d/%m/%Y %H:%M:%S")
        UCdata$Date <- as.Date(UCdata$Date)
        
        ## draw plot in a window
        par(mfrow = c(1,1), mar = c(5,4,4,2), cex = .75, cex.lab = 1)
        with(UCdata, {
                plot(Time, Sub_metering_1, main = "", type = "l",
                          xlab = "", ylab = "Energy sub metering")
                points(Time, Sub_metering_2, type = "l", col = "red")
                points(Time, Sub_metering_3, type = "l", col = "blue")
        })
        legend("topright", col = c("black", "red", "blue"), 
               lty = c(1,1,1), legend = colnames(UCdata[,7:9]),
               text.width = 50000)
        
        ## copy to PNG file
        dev.copy(png, file = "plot3.png")
        dev.off()
        
} 