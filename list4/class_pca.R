mtcars.pca <- prcomp(mtcars[,c(1:7,10,11)], center = TRUE,scale. = TRUE)
summary(mtcars.pca)
  
str(mtcars.pca)

library(ggbiplot)

mtcars.country <- c(rep("Japan", 3), rep("US",4), rep("Europe", 7),rep("US",3),
                    "Europe", rep("Japan", 3), rep("US",4), rep("Europe", 3), "US", rep("Europe",
                                                                                        3))
#ggbiplot(mtcars.pca,ellipse=TRUE, labels=rownames(mtcars),
#         groups=mtcars.country)

#ggbiplot(mtcars.pca,ellipse=TRUE,choices=c(3,4), labels=rownames(mtcars),
#         groups=mtcars.country)

#ggbiplot(mtcars.pca,ellipse=TRUE,circle=TRUE, labels=rownames(mtcars),
#         groups=mtcars.country)

#ggbiplot(mtcars.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1,
#         labels=rownames(mtcars), groups=mtcars.country)

#ggbiplot(mtcars.pca,ellipse=TRUE,obs.scale = 1, var.scale = 1,var.axes=FALSE,
#         labels=rownames(mtcars), groups=mtcars.country)

spacecar <- c(1000,60,50,500,0,0.5,2.5,0,1,0,0)


s.sc <- scale(t(spacecar[c(1:7,10,11)]), center= mtcars.pca$center)
s.pred <- s.sc %*% mtcars.pca$rotation
mtcars.plusproj.pca <- mtcars.pca
mtcars.plusproj.pca$x <- rbind(mtcars.plusproj.pca$x, s.pred)
ggbiplot(mtcars.plusproj.pca, obs.scale = 1, var.scale = 1, ellipse = TRUE,
         circle = FALSE, var.axes=TRUE, labels=c(rownames(mtcars), "spacecar"),
         groups=mtcars.countryplus)+
  scale_colour_manual(name="Origin", values= c("forest green", "red3", "violet",
                                               "dark blue"))+
  ggtitle("PCA of mtcars dataset, with extra sample projected")+
  theme_minimal()+
  theme(legend.position = "bottom")