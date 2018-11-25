pngFilename <- "plot2.png"
mfrow = c(1, 1)

## Plot to the currently active device
f_plot <- function() {
  par(mfrow = mfrow, mar=c(4, 4, 2, 1), oma = c(2, 2, 2, 0)) 
  xlab <- ""
  ylab <- "Global Active Power (kilowatts)"
  title <- ""
  lType <- "l"
  plot <- with(data, plot(Time, Global_active_power, type = lType, xlab = xlab, ylab = ylab, main = title))
  box(which = "plot", lty = "solid")
}

## Initialize and read the data
source("./util.R")
data <- utPlot(f_plot, pngFilename)

