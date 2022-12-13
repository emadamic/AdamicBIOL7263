# Script for Bekah Assignment, to compare insulas of two people
# Written by: Emily Adamic 12/12/22

setwd("/Users/eadamic/Dropbox (LIBR)/My PC (EmilysYoga)/Desktop/BIOL7263_Seminar_DataReproducibleAnalyses/AdamicBIOL7263/Assignments")
filelist = c("Data/AU114.X38.insula.jpg", "Data/BK248.X38.insula.jpg")

# make the tps
digitize2d(filelist, nlandmarks = 11, scale=3, tpsfile = "insulas.tps", verbose=TRUE)

# read in the tps, make it into nice x and y coord
mydata = readland.tps("insulas.tps", specID="ID")
Y.gpa = gpagen(mydata, print.progress=FALSE)
ref = mshape(Y.gpa$coords)

# now plot it
plotRefToTarget(ref, Y.gpa$coords[,,1], method="TPS")
plotRefToTarget(ref, Y.gpa$coords[,,2], method="TPS")

# plot diff between the two in TPS, vector, and points 
plotRefToTarget(ref, Y.gpa$coords[,,2], mag=3, method="TPS")
plotRefToTarget(ref, Y.gpa$coords[,,2], mag=3, method="vector")
plotRefToTarget(ref, Y.gpa$coords[,,2], mag=3, method="points")

# now plot all the specimens 
plotAllSpecimens(Y.gpa$coords, label=T, 
                 plot.param = list(pt.bg = "green", mean.cex=1, link.col= "red", txt.pos=3, txt.cex=1))





