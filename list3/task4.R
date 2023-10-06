
filepath <- paste0(getwd(), "/", "kalimati_tarkari_dataset.csv")
dataset <- read.csv(filepath)

dataset <- dataset[dataset$Commodity  == "Tomato Small(Local)",]
#dataset$day <- seq(1, nrow(dataset))
dataset$day <- seq(1, nrow(dataset)) / 365
dataset <- subset(dataset, select = c(day, Average))
#dataset$year <- dataset$day / 365
print(head(dataset))

plot(dataset$day, dataset$Average, type = "l", xlab = "Time[days]", ylab = "Average price", main = "Tomato prices in Nepal")

# Calculate FFT and plot the complex module vs. frequency
fft_averages <- fft(dataset$Average)
#fft_averages <- fft(data.frame(unlist(dataset$day), unlist(dataset$Average)))
#fft_averages <- fft(cbind(dataset$day, dataset$Average))

#N <- nrow(dataset) - 1
#sampling_rate <- 1  # Assuming 1 sample per day
#freqs <- (0:(N-1)) * sampling_rate / N

plot(ylim = c(0,10000), Mod(fft_averages), xlim=c(0,10),type = "l", xlab = "Frequency", ylab = "Complex Module", main = "FFT of prices")