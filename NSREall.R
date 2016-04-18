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

#this is the directory where the NSRE data is located
setwd("//Aa.ad.epa.gov/ord/NAR/Users/EC1/NMerri02/Net MyDocuments/Rec_participation/NSRE/NSRE all")

#converts from sas7bdat to r dataframes
data5=read.sas7bdat.parso("version5.sas7bdat")
data7=read.sas7bdat.parso("version7.sas7bdat")
data9=read.sas7bdat.parso("version9.sas7bdat")
data11=read.sas7bdat.parso("version11.sas7bdat")
data13=read.sas7bdat.parso("version13.sas7bdat")

#makes all the variables the same case so that they combine.
names(data5)=tolower(names(data5))
names(data7)=tolower(names(data7))
names(data9)=tolower(names(data9))
names(data11)=tolower(names(data11))
names(data13)=tolower(names(data13))

#writes each seperately as STATA files
write.dta(data5, "NSRE5.dta") 
write.dta(data7, "NSRE7.dta") 
write.dta(data9, "NSRE9.dta") 
write.dta(data11, "NSRE11.dta") 
write.dta(data13, "NSRE13.dta") 

#combines them together into one dataframe in r
NSRE2000all=smartbind(data5,data7,data9,data11,data13)
NSRE2000all[NSRE2000all==""] <- NA #stata doesnt like blanks, replaces them with NA's

#writes it all to on stata file
write.dta(NSRE2000all, "//Aa.ad.epa.gov/ord/NAR/Users/EC1/NMerri02/Net MyDocuments/Rec_participation/NSRE/NSRE all/NSRE2000all.dta") 
