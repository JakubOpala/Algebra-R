filepath <- paste0(getwd(), "/", "turkey_earthquakes.csv")
dataset <- read.csv(filepath)

dataset <- dataset[, 4:(ncol(dataset) - 2)]

time_parts <- strsplit(dataset$Time, "[:.]")

hours <- sapply(time_parts, function(x) as.numeric(sub("^0*", "", x[1])))
minutes <- sapply(time_parts, function(x) as.numeric(sub("^0*", "", x[2])))
seconds <- sapply(time_parts, function(x) as.numeric(sub("^0*", "", x[3])))
milliseconds <- sapply(time_parts, function(x) as.numeric(sub("^0*", "", x[4])))

# Calculate the numeric representation of time
dataset$Time_numeric <- hours * 3600 + minutes * 60 + seconds + milliseconds/1000
dataset <- dataset[, -1]

set.seed(42)
dataset <- dataset[sample(nrow(dataset),150),]

dataset.pca <- prcomp(dataset, center = TRUE, scale. = TRUE)
summary(dataset.pca)

str(dataset.pca)

library(ggbiplot)

print(head(dataset))

ggbiplot(dataset, labels = dataset$Date)
