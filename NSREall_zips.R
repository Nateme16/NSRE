##NSRE to STATA##

#This file takes the NSRE data in sas7bdat format and puts it together in STATA

rm(list=ls())
library(sas7bdat)
library(sas7bdat.parso)
library(foreign)
library(plyr)
library(haven)
library(gtools)
library(zipcode)

load("C:/Users/nmerri02/Desktop/GitHub/NSRE/NSRE_zip.RData")

NSRE2000all$zip2=clean.zipcodes(NSRE2000all$zipcode)

NSRE2000all_zip=merge(NSRE2000all,zipcode,by.x='zip2',by.y='zip')


#writes it all to on stata file
NSRE2000all_zip[NSRE2000all_zip==""] <- NA #stata doesnt like blanks, replaces them with NA's
write.dta(NSRE2000all_zip, "//Aa.ad.epa.gov/ord/NAR/Users/EC1/NMerri02/Net MyDocuments/Rec_participation/NSRE/NSRE all/NSRE2000all_zip.dta") 

