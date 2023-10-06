x <- c(seq(-1, 1, length.out = 100), seq(1, -1, length.out = 100))
tri_wave <- c(rep(x, 2))
mirrored <- -tri_wave
#mirrored <- rev(tri_wave)
repeated <- c(rep(tri_wave, 10))
padded <- c(tri_wave, array(0, dim = c(800)))


plot(tri_wave, type = "l", xlab = "Time", ylab = "Amplitude", main = "Triangular Wave")
fft_tri_wave <- fft(tri_wave)
plot(Mod(fft_tri_wave), type = "l", xlab = "Frequency", ylab = "Complex Module", main = "FFT of Triangular Wave")


plot(mirrored, type = "l", xlab = "Time", ylab = "Amplitude", main = "Mirrored Triangular Wave")
fft_mirrored <- fft(mirrored)
plot(Mod(fft_mirrored), type = "l", xlab = "Frequency", ylab = "Complex Module", main = "FFT of Mirrored Triangular Wave")


plot(repeated, type = "l", xlab = "Time", ylab = "Amplitude", main = "10x Repeated Triangular Wave")
fft_repeated <- fft(repeated)
plot(Mod(fft_repeated), type = "l", xlim=c(0,xlab = "Frequency", ylab = "Complex Module", main = "FFT of 10x Repeated Triangular Wave")


plot(padded, type = "l", xlab = "Time", ylab = "Amplitude", main = "Padded Triangular Wave")
fft_padded <- fft(padded)
plot(Mod(fft_padded), type = "l", xlab = "Frequency", ylab = "Complex Module", main = "FFT of Padded Triangular Wave")