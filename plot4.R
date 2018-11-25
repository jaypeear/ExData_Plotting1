pngFilename <- "plot4.png"
mfrow = c(2, 2)

## Plot to the currently active device
f_plot <- function() {
  par(mfrow = mfrow, mar=c(4, 4, 2, 1), oma = c(2, 2, 2, 0)) 
  # Graph #1
  # ========
  xlab <- ""
  ylab <- "Global Active Power"
  title <- ""
  lType <- "l"
  plot <- with(data, plot(Time, Global_active_power, type = lType, xlab = xlab, ylab = ylab, main = title))
  box(which = "plot", lty = "solid")
  
  # Graph #2
  # ========
  xlab <- "datetime"
  ylab <- "Voltage"
  title <- ""
  lType <- "l"
  plot <- with(data, plot(Time, Voltage, type = lType, xlab = xlab, ylab = ylab, main = title))
  box(which = "plot", lty = "solid")
  
  # Graph #3
  # ========
  xlab <- ""
  ylab <- "Energy sub Metering"
  title <- ""
  lType <- "l"
  plot <- with(data, plot(Time, Sub_metering_1, type = lType, xlab = xlab, ylab = ylab, main = title))
  # Add the two lines for sub metering 2 and 3
  with(data, lines(Time, Sub_metering_2, col = "red"))
  with(data, lines(Time, Sub_metering_3, col = "blue"))
  # Drwa a legend
  legend("topright", lty = rep(1, 3), 
                     col = c("black", "red", "blue"), 
                     legend = names(data)[7:9],
                     bty = "n")
  box(which = "plot", lty = "solid")
  
  # Graph #4
  # ========
  xlab <- "datetime"
  ylab <- "Global_reactive_power"
  title <- ""
  lType <- "l"
  plot <- with(data, plot(Time, Global_reactive_power, type = lType, xlab = xlab, ylab = ylab, main = title))
  box(which = "plot", lty = "solid")
}

## Initialize and read the data
source("./util.R")
data <- utPlot(f_plot, pngFilename)

