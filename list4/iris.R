dataset <- data("iris")


dataset.pca <- prcomp(dataset, center = TRUE, scale. = TRUE)
summary(dataset.pca)

str(dataset.pca)

library(ggbiplot)

print(head(dataset))

ggbiplot(dataset.pca,ellipse=TRUE,
         groups=dataset$)