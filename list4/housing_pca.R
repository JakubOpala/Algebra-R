filepath <- paste0(getwd(), "/", "housing.csv")
dataset <- read.csv(filepath)


library(ggplot2)

plot <- ggplot(dataset, aes(x = longitude, y = latitude)) +
  geom_point(aes(size = population/100, color = median_house_value), alpha = 0.4) +
  scale_color_gradientn(colours = colorRampPalette(c("blue", "red"))(10), name = "Median House Value", guide = "colorbar") +
  theme(plot.margin = margin(1, 1, 1, 1), plot.title = element_text(size = 12), axis.title = element_blank(), axis.text = element_blank(), axis.ticks = element_blank(), panel.grid = element_blank()) +
  theme(legend.position = "right")

print(plot)



dataset$rooms_per_house <- dataset$total_rooms / dataset$households
dataset$bedrooms_per_room <- dataset$total_bedrooms / dataset$total_rooms
dataset$people_per_house <- dataset$population / dataset$households

#dataset <- dataset[, -c(4,5,10)]
set.seed(42)

# Convert data to a data frame
data <- as.data.frame(data)

# Create the "Location" column and initialize with "None"
data$Location <- "None"

# Define the longitude and latitude ranges for San Francisco and Los Angeles
sf_latitude_range <- c(37.6, 37.9)
sf_longitude_range <- c(-123.2, -122.3)
la_latitude_range <- c(34.0, 34.4)
la_longitude_range <- c(-118.5, -118.1)

#"San Francisco" label
data[data$latitude >= sf_latitude_range[1] & data$latitude <= sf_latitude_range[2] & 
       data$longitude >= sf_longitude_range[1] & data$longitude <= sf_longitude_range[2], "Location"] <- "San Francisco"

#"Los Angeles" label
data[data$latitude >= la_latitude_range[1] & data$latitude <= la_latitude_range[2] & 
       data$longitude >= la_longitude_range[1] & data$longitude <= la_longitude_range[2], "Location"] <- "Los Angeles"

dataset <- dataset[sample(nrow(dataset),150),]


dataset.pca <- prcomp(dataset[, -c(4,5,10,17)], center = TRUE, scale. = TRUE)
summary(dataset.pca)

str(dataset.pca)

library(ggbiplot)

print(head(dataset[, -c(4,5,10,17)]))

ggbiplot(dataset.pca,ellipse=TRUE, groups=dataset$ocean_proximity)

#the more expensive houses - the less bedrooms per room
#


#ggbiplot(dataset.pca,ellipse=TRUE, groups=dataset$Location)

#ggbiplot(dataset.pca) #, labels = dataset$median_house_value)
