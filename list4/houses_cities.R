# Subset Los Angeles instances
la_subset <- subset(data, Location == "Los Angeles", select = -Location)
la_subset <- la_subset[1:5, ]

# Subset San Francisco instances
sf_subset <- subset(data, Location == "San Francisco", select = -Location)
sf_subset <- sf_subset[1:5, ]

# Subset rest of California instances
rest_ca_subset <- subset(data, Location != "Los Angeles" & Location != "San Francisco", select = -Location)
rest_ca_subset <- rest_ca_subset[sample(nrow(rest_ca_subset), 120), ]
dataset <- rbind(la_subset, sf_subset, rest_ca_subset)