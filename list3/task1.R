# TRAINGULAR WAVE ------------------------------------------------------------------------------------

x <- c(seq(-1, 1, length.out = 100), seq(1, -1, length.out = 100))
tri_wave <- c(rep(x, 2))

# Plot the waveform
plot(tri_wave, type = "l", xlab = "Time", ylab = "Amplitude", main = "Triangular Wave")

# Calculate FFT and plot the complex module vs. frequency
fft_tri_wave <- fft(tri_wave)
plot(Mod(fft_tri_wave), type = "l", xlab = "Frequency", ylab = "Complex Module", main = "FFT of Triangular Wave")

# SQUARE WAVE ------------------------------------------------------------------------------------

# Generate data for two periods of a square wave
x <- c(rep(-1, 50), rep(1, 50))
square_wave <- c(rep(x, 2))

# Plot the waveform
plot(square_wave, type = "l", xlab = "Time", ylab = "Amplitude", main = "Square Wave")

# Calculate FFT and plot the complex module vs. frequency
fft_square_wave <- fft(square_wave)
plot(Mod(fft_square_wave), type = "l", xlim=c(0,10),xlab = "Frequency", ylab = "Complex Module", main = "FFT of Square Wave")

# RANDOM NOISE ------------------------------------------------------------------------------------

# Generate data for a random noise signal
noise_signal <- rnorm(200)

# Plot the waveform
plot(noise_signal, type = "l", xlab = "Time", ylab = "Amplitude", main = "Random Noise Signal")

# Calculate FFT and plot the complex module vs. frequency
fft_noise_signal <- fft(noise_signal)
plot(Mod(fft_noise_signal), type = "l", xlab = "Frequency", ylab = "Complex Module", main = "FFT of Random Noise Signal")