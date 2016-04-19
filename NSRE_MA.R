

#This file takes the NSRE data and estimates participation, # of trips and travel distribution

rm(list=ls())
library(sas7bdat)
library(sas7bdat.parso)
library(foreign)
library(plyr)
library(haven)
library(gtools)
library(zipcode)

load("C:/Users/nmerri02/Desktop/GitHub/NSRE/NSRE2000all_zip.RData")

# Beach visitation question  ---------------------------------------------------------------

#get beachgoing participation rate US
NSRE=NSRE2000all_zip
beachies=sum(na.omit(NSRE$beach_s[NSRE$beach_s==1]))
beach_participation_US=beachies/nrow(NSRE)
#get beachgoing reate US
beachdaysUS=na.omit(NSRE$beachd[NSRE$beachd>=0])

#get beachgoing participation rate MA
NSRE_MA=NSRE[NSRE$state.x=="MA",]
beachies=sum(na.omit(NSRE_MA$beach_s[NSRE_MA$beach_s==1]))
beach_participation_MA=beachies/nrow(NSRE_MA)
#get beachgoing rate MA
beachdaysMA=na.omit(NSRE_MA$beachd[NSRE_MA$beachd>=0])

#get beachgoing participation rate NE
NSRE_NE=NSRE[NSRE$state.x=="MA"|NSRE$state.x=="RI"|NSRE$state.x=="CT"|NSRE$state.x=="NH"|NSRE$state.x=="ME"|NSRE$state.x=="VT",]
beachies=sum(na.omit(NSRE_NE$beach_s[NSRE_NE$beach_s==1]))
beach_participation_NE=beachies/nrow(NSRE_NE)
#get beachgoing rate NE
beachdaysNE=na.omit(NSRE_NE$beachd[NSRE_NE$beachd>=0])


# SW module ---------------------------------------------------------------

#get saltwater beachgoing participation and visit rate US 
swUS=subset(NSRE,swsday<=2)
swUS_part=sum(swUS$swsday==1)/nrow(swUS)
swtripsUS=subset(swUS,swUS$swtrips>=0)
summary(swtripsUS$swtrips)

#get saltwater beachgoing participation and visits rate NE 
swNE=swUS[swUS$state.x=="MA"|swUS$state.x=="RI"|swUS$state.x=="CT"|swUS$state.x=="NH"|swUS$state.x=="ME"|swUS$state.x=="VT",]
swNE_part=sum(swNE$swsday==1)/nrow(swNE)
swtripsNE=subset(swNE,swNE$swtrips>=0)
summary(swtripsNE$swtrips)

#get saltwater beachgoing participation and visits rate MA 
swMA=swUS[swUS$state.x=="MA",]
swMA_part=sum(swMA$swsday==1)/nrow(swMA)
swtripsMA=subset(swMA,swMA$swtrips>=0)
summary(swtripsMA$swtrips)


# Travel distributions -----------------------------------------------------
#from the SW module

#US
NSRE_dist_US=subset(NSRE,NSRE$swsday==1)
dist_US=NSRE_dist_US$swdist1[NSRE_dist_US$swdist1>0]
time_US=NSRE_dist_US$swtime1[NSRE_dist_US$swtime1>0]

#NE
NSRE_dist_NE=subset(NSRE_NE,NSRE_NE$swsday==1)
dist_NE=NSRE_dist_NE$swdist1[NSRE_dist_NE$swdist1>0]
time_NE=NSRE_dist_NE$swtime1[NSRE_dist_NE$swtime1>0]

#MA
NSRE_dist_MA=subset(NSRE_MA,NSRE_MA$swsday==1)
dist_MA=NSRE_dist_MA$swdist1[NSRE_dist_MA$swdist1>0]
time_MA=NSRE_dist_MA$swtime1[NSRE_dist_MA$swtime1>0]
