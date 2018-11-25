
## Read the data
f_readData <- function() {
  dataFileName <- "household_power_consumption.txt"
  dateFormat <- "%d/%m/%Y"
  colClasses <- c(NA, NA, 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
  naStrings <- c("?")
  data <- read.csv(dataFileName, sep=";", header = T, colClasses=colClasses, 
                   na.strings=naStrings, stringsAsFactors = F)
  # Convert Dates to Date class and select the 2 requested dates
  data$Date <- as.Date(data$Date, dateFormat)
  startDate <- as.Date("2007-02-01")
  endDate <- as.Date("2007-02-02")
  data <- data[data$Date >= startDate & data$Date <= endDate,  ]
  dateTime <- paste(data$Date, data$Time, " ")
  data$Time <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")
  data
}

utPlot <- function(plotFunction, pngFilename) {
  rm(list = ls())
  
  ## Initialize plotting environment
  plot.new()
  dev.off()
  
  ## Read the data
  data <- f_readData()
  
  ## Plot to screen
  f_plot()
  
  ## plot to png
  pngWidth <- 480
  pngHeight <- 480
  png(filename = pngFilename, width = pngWidth, height = pngHeight)
  f_plot()
  dev.off()
  
  data
}
