install.packages("spatstat")
install.packages("maptools")
install.packages("lattice")

library(spatstat)
library(maptools)
library(lattice)

summary(japanesepines)

plot(japanesepines, main="Pines", axes = TRUE)


spjpines = as(japanesepines, "SpatialPoints")
plot(spjpines)
