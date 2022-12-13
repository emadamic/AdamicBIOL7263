library(geomorph)

# will turn photos into useable R things? 

filelist = list.files(pattern=".jpeg")
filelist = filelist[ filelist %in% c("pic0224.jpeg", "pic1.jpeg" )]

# make a new plot window outside of RStudio so that the picking of points works way faster 
dev.new(noRStudioGD = TRUE)

# will take jpegs and output into a tps file 
digitize2d(filelist, nlandmarks = 11, scale = 3, tpsfile = "shrimp3.tps", verbose = TRUE)

# first click is setting scale - begin and end 
# that's why you need to have a ruler in your pic 

# so would set scale then have a list of landmarks you'd want to put on each one... 
# Landmark 1 = tail
# Landmark 2 = head 
# Landmark 3 = eye 
# etc... and so could plot "Landmark 1 to 2 distance" for each pic/organism 

# "shape-iness" of things rather than length, size, or something
# i.e. could be different sizes but same shape, and so this would scale the sizes but retain differences in shape

## Moving on to salamanders... 
data("plethodon")
Y.gpa = gpagen(plethodon$land, print.progress=TRUE)
ref = mshape(Y.gpa$coords)

plotRefToTarget(ref, Y.gpa$coords[,,39], mag=3, method="points")
# method could be "points", "TPS", or "vector" 

gp2 = gridPar(pt.bg = "green", pt.size=1)

### MY ASSIGNMENT: 
## find two pics of anatomical scans in native subject space
## outline insula as well as macroanatomical folds 





################################################################################

# Beerbaum's pres: phylogeny

library(phytools)
library(geiger)
library(diversitree)
library(mapplots)

phylo1 <- "((Caudata, Anura), Gymnophiona);"
Amphibians <- read.tree(text=phylo1)
plotTree(Amphibians)
add.arrow(Amphibians=NULL, tip=1, offset= 8) # 1 is a tthe bottom 

? read.tree

phylo2<-
  "(((((((cow, pig),whale),(bat,(lemur,human))),(blue_jay,snake)),coelacanth),gold_fish),lamprey);"
vert_tree<-read.tree(text=phylo2)
class(vert_tree) # class is phylo 

plot(vert_tree, no_margin=TRUE, edge.width=5, edge.color = "skyblue")
roundPhylogram(vert_tree)

# salsRkewl 
Salamanders<-
  "(((((((Amphiumidae,Plethodontidae),Rhyacotritonidae),((Ambystomatidae,Dicamptodontidae),Salamandridae)),Proteidae)),Sirenidae),(Hynobiidae,Cryptobranchidae));"
Mander.tree<-read.tree(text=Salamanders)
plot(Mander.tree, label.offset = 0.2)

class(Salamanders)
class(Mander.tree)

Ntip(Mander.tree)
plotTree(Mander.tree, offset=0.5)
tiplabels()
nodelabels()

drop=drop.tip(Mander.tree, 8)


time_calibrated<-read.tree("time_cal")
plot(time_calibrated)


SallyTree <- read.nexus("Bonett_tree")
plot(SallyTree)
tiplabels()

plotTree(SallyTree, ftype = "i", fsize=0.2, lwd=1)
Ntip(SallyTree)
tips = SallyTree$tip.label
genera <- unique( sapply(strsplit(tips, "_"), function(x) x[1] )   )






