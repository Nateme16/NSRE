*This file explores the NSRE for the Cape project
clear all
use "L:\Public\SHC 4.61\Economics\Data\NSRE\NSRE2000all_STATA\NSRE2000all.dta" 

*keeps only trips to MA
keep if swstate1==12
