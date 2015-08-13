setwd('win/user/oconee/Inputs/')


master = read.csv('master_oweb_grantlist.csv')

library(plyr)
library(reshape2)
library(dplyr)


wc_grants = master[grep(' WC',master$Grantee),]
              
unique(wc_grants$Project.Status)

table(wc_grants$Project.Status)




               length(unique(master$Grantee))
               
               master$Grantee