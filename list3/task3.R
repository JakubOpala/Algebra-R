x <- c(seq(-1, 1, length.out = 100), seq(1, -1, length.out = 100))

tri_wave <- c(rep(x, 2))
fft_tri_wave <- fft(tri_wave)

tri_wave_squares <- sum(tri_wave^2)
fft_tri_wave_squares <- sum(fft_tri_wave^2) / length(fft_tri_wave)

print(paste("Sum of squares in original signal: ", tri_wave_squares))
print(paste("Arithmetic mean of squares in fft signal: ", fft_tri_wave_squares))

epsilon <- 0.1

if (abs(tri_wave_squares - fft_tri_wave_squares) < epsilon) {
  print("Parseval's equality works")
}