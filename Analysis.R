#Install ChAMP
source("http://bioconductor.org/biocLite.R") 
biocLite("ChAMP")
library(ChAMP)
myLoad <- champ.load() #load dataset using samplesheet.csv
myNorm <- champ.norm() #beta values normalized with BMIQ method
champ.SVD() #SVD analysis
myNorm <- champ.runCombat(beta=myNorm,pd=myLoad$pd,batchname=c("Slide")) #batch correction
limma <- champ.DMP(adjPVal = 1)  #No filtration
df <- limma[[1]]  #statistic information