library(tidyverse)
library(stats)


df = read.csv("pheromone_data.csv")
df.mat = as.matrix(df[,-1])
rownames(df) <- df[,1]

heatmap(df.mat) # heatmap() will automatically re-order cols/rows by the clustering method
# will put the dendogram of the clustering

heatmap(df.mat, 
        Colv = NA, Rowv=NA, # will take out the re-ordering and clustering 
        margins=c(7,5), # needed for the plot 
        cexCol = 1,  
        col = terrain.colors(10), # col pallettes, # is the # of steps... discrete! 
        main = "Pheromone Gene Expression",
        xlab = "Groups", ylab = "Gene"
        )

