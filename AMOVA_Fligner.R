library(adegenet)
library(poppr)
library(ape)
library(car)


setwd("~/hembeli/")
rm(list=ls())
hembeli.geneid.nout = read.genepop("NCmodP3s50.snps.gen")
hembeli_strata<-read.csv(file = "StrataInformation.csv",header = TRUE)
hembeli_strata
strata(hembeli.geneid.nout)=hembeli_strata
hembeli.geneid.nout



##AMOVA
hembeli.Region.amova = poppr.amova(hembeli.geneid.nout, ~Region/Site, cutoff = 0.9)
hembeli.pop.amova=poppr.amova(hembeli.geneid.nout,~Site,cutoff=0.9)

####Print Results
hembeli.Region.amova
hembeli.pop.amova
##Randomization Test

hembeli.Region.rtest<-randtest(hembeli.Region.amova,nrepet = 999)
hembeli.Region.rtest

hembeli.pop.amova.rtest<randtest(hembeli.pop.amova,nrepet=999)
hembeli.site.amova.pop.rtest
plot(hembeli.site.amova.pop.rtest)


##Flinger tests of homogeneity
##Fligner tests apparently handle non-normal datasets well.


#Seperate out collection sites and remove loci with only missing data within collection site.
seperated<-seppop(hembeli.geneid.nout)
hembeli.jordan.noFullyMissing<-missingno(seperated$Jordan9_2,cutoff = 0.99)
hembeli.loving.noFullyMissing<-missingno(seperated$LovingH9,cutoff = 0.99)
hembeli.black.noFullyMissing<-missingno(seperated$Black9_2,cutoff = 0.99)
hembeli.brown.noFullyMissing<-missingno(seperated$Brown9_2,cutoff = 0.99)

#Calculate population summary statistics
div<-summary(hembeli.geneid.nout)
jordan_div<-summary(hembeli.jordan.noFullyMissing)
loving_div<-summary(hembeli.loving.noFullyMissing)
black_div<-summary(hembeli.black.noFullyMissing)
brown_div<-summary(hembeli.brown.noFullyMissing)

##Perform fligner test
fligner.test(list(div$Hexp, div$Hobs))
fligner.test(list(jordan_div$Hexp, jordan_div$Hobs))
fligner.test(list(loving_div$Hexp, loving_div$Hobs))
fligner.test(list(black_div$Hexp, black_div$Hobs))
fligner.test(list(brown_div$Hexp, brown_div$Hobs))

mean(brown_div$Hexp)
mean(brown_div$Hobs)
