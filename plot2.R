## This script is creating a Plot#2 for a Course Project #1 of Exploratory 
## Data Analysis course of Coursera. 

drawChart2 <- function() {
        
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
        with(UCdata, plot(Time, Global_active_power, main = "", type = "l",
                          xlab = "", ylab = "Global Active Power (kilowatts)"))
        
        ## copy to PNG file
        dev.copy(png, file = "plot2.png")
        dev.off()
        
} 