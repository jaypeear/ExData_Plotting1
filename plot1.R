pngFilename <- "plot1.png"
mfrow = c(1, 1)

## Plot to the currently active device
f_plot <- function() {
  par(mfrow = mfrow, mar=c(4, 4, 2, 1), oma = c(2, 2, 2, 0)) 
  xlab <- "Global Active Power (kilowatts)"
  xlim <- c(0, 7)
  title = "Global Active Power"
  hist <- with(data, hist(Global_active_power, col = "red", xlab=xlab, xlim=xlim, xaxt='n', main=title))
  axis(side = 1, at = seq(0,6, 2), tick = T)
}

## Initialize and read the data
source("./util.R")
data <- utPlot(f_plot, pngFilename)

