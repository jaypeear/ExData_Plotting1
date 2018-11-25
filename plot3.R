pngFilename <- "plot3.png"
mfrow = c(1, 1)

## Plot to the currently active device
f_plot <- function() {
  par(mfrow = mfrow, mar=c(4, 4, 2, 1), oma = c(2, 2, 2, 0)) 
  xlab <- ""
  ylab <- "Energy sub metering"
  title <- ""
  lType <- "l"
  # Plot the first line for sub metering 1
  plot <- with(data, plot(Time, Sub_metering_1, type = lType, xlab = xlab, ylab = ylab, main = title))
  # Add the two lines for sub metering 2 and 3
  with(data, lines(Time, Sub_metering_2, col = "red"))
  with(data, lines(Time, Sub_metering_3, col = "blue"))
  # Drwa a legend
  legend("topright", lty = rep(1, 3), 
                     col = c("black", "red", "blue"), 
                     legend = names(data)[7:9])
  # Draw a surrounding box
  box(which = "plot", lty = "solid")
}

## Initialize and read the data
source("./util.R")
data <- utPlot(f_plot, pngFilename)

