filepath <- paste0(getwd(), "/", "kalimati_tarkari_dataset.csv")
dataset <- read.csv(filepath)

dataset <- dataset[dataset$Commodity  == "Tomato Small(Local)",]
dataset$day <- seq(1, nrow(dataset))
dataset$year <- dataset$day / 365
#dataset <- subset(dataset, select = c(day, Average))
dataset <- subset(dataset, select = c(day, Average))



# Compute the FFT of the prices
fft_result <- fft(dataset$Average)

# Define the frequency resolution
frequency_resolution <- 1

# Calculate the number of samples and the sample rate
num_samples <- length(dataset$year)
sample_rate <- 1 / frequency_resolution

# Calculate the indices for the desired frequency range
start_index <- 1
end_index <- num_samples

# Extract the frequencies and corresponding magnitudes within the desired range
frequencies <- seq(1, (length(fft_result)+1) * frequency_resolution, length.out = length(fft_result)) / 7
magnitudes <- Mod(fft_result[start_index:end_index])

# Create a dataframe with the frequencies, magnitudes, and corresponding days
fft_data <- data.frame(frequencies, magnitudes)

plot(dataset$day, dataset$Average, type = "l", xlab = "Time[days]", ylab = "Average price", main = "Tomato prices in Nepal")


#xlim=c(0.001,3),
print(length(fft_data$frequencies))
print(length(fft_data$magnitudes))

plot(fft_data$frequencies,fft_data$magnitudes,type = "l", xlab = "Frequency", ylab = "Complex Module", main = "FFT of prices")

# Print the resulting dataframe
print(fft_data)
