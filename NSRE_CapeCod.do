*This file explores the NSRE for the Cape project
clear all
use "L:\Public\SHC 4.61\Economics\Data\NSRE\NSRE2000all_STATA\NSRE2000all_zip.dta" 

*keep MA zip codes

keep if zipcode 

keep if beach_s==1 | beach_s==8



*keeps only trips to MA
keep if swstate1==12
