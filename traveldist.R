
rm(list=ls())
library(fitdistrplus)
load("//Aa.ad.epa.gov/ord/NAR/Users/EC1/NMerri02/Net MyDocuments/Rec_participation/NSRE/NSRE all/NSRE2000all.RData")

sw=subset(NSRE2000all, swsday==1)

dist=sw['swdist1']
dist=unlist(dist)
dist=dist[dist>0]
hist(dist, breaks=100, xlim=c(0,1000))
dist=as.numeric(dist)

dist=as.numeric(na.omit(dist))
dist=dist[dist<500]
a=fitdist(dist,"gamma",method="mle")
b=fitdist(dist,"gamma",method="mme")

gofstat(list(a,b))
test=dgamma(100,shape=.73,rate=.011)