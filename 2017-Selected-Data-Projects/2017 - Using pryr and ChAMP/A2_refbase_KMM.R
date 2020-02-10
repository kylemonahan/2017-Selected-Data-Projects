##  ----------------------------------------
##  Suggested changes for Chao Qiang Lai to limit memory usage of R code 
##  Date: 1-9-2017
##  By: Kyle Monahan
##  Version: RStudio 1.0.1 
##  ----------------------------------------
##
##

##-------------------- Getting Started ------------------
## 
##  To access other online resources on statistics, see go.tufts.edu/stats
##-------------------- Getting Started ------------------

##-------------------- Original Code -------------------


#.libPaths("/cluster/home/c/l/clai04/R/x86_64-pc-linux-gnu-library/3.3/")
library(pryr)
library(ChAMP)
#champ.process(directory = getwd())

myLoad=champ.load(directory = getwd())

myImpute <- champ.impute()
champ.QC()
myNorm <- champ.norm()
champ.SVD()
myCombat <- champ.runCombat()
myDMP <- champ.DMP()
myDMR <- champ.DMR()
myBlock <- champ.Block()
myGSEA <- champ.GSEA()
myEpiMod <- champ.EpiMod()
myCNA <- champ.CNA()
#myRefFree <- champ.reffree()
myRefbase <- champ.refbase() ### for blood sample only

#KMM - Write.table is fairly slow and memory intensive. Try out write.csv to see if it is faster. Placing a data frame as a matrix can also help reduce memory. We can wrap the code with system.time to have R report the amount of time it takes.
system.time(write.csv(as.matrix(data.frame(myRefbase$CorrectedBea)), "CorrectedBea.xls"),col.name=TRUE, row.names=TRUE,sep="\t")
#KMM - More information here: https://stackoverflow.com/questions/10505605/speeding-up-the-performance-of-write-table

#KMM - You can also use object size to check the size of objects in R. See below:
pryr::object_size(write.csv(as.matrix(data.frame(myRefbase$CorrectedBea))))
pryr::object_size(write.csv(data.frame(myRefbase$CorrectedBea)))

write.table(data.frame(myRefbase$CorrectedBea),file="CorrectedBea.txt",col.name=TRUE, row.names=TRUE,sep="\t")
write.table(data.frame(myRefbase$CellFraction),file="CellFraction.txt",col.name=TRUE, row.names=TRUE,sep="\t")

#write.table(data.frame(myNorm$beta),file="norm_beta_celltype.txt",col.name=TRUE, row.names=TRUE,sep="\t")


