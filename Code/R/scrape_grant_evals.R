rm(list=ls())
library(rvest)
library(magrittr)
library(RCurl)
library(plyr)
library(dplyr)
setwd('/homes/tscott1/win/user/oweb2014_grants')

url <- "http://apps.wrd.state.or.us/apps/oweb/fiscal/default.aspx"
your.username = 'grantee'
your.password = 'oweb'
require(SAScii) 
require(RCurl)
require(XML)

url = 'http://apps.wrd.state.or.us/apps/oweb/fiscal/default.aspx'

oweb.session = rvest::html_session(url)
oweb.form <- html_form(oweb.session)[[1]]
oweb.form

oweb.form <- set_values(oweb.form, txtuser = "grantee",
                        txtpwd = 'oweb') 

df.empty = NULL
#There are 6 regions
regions = paste('Region',1:6)
for (j in 1:length(regions))
{
  df.new = 
submit_form(oweb.session,oweb.form) %>%
   rvest::follow_link(,i = 'Current') %>%
  rvest::follow_link(,i = regions[j]) %>%
  html() %>%
  html_table(header = T,trim = T,fill = T)
df.new$Region = regions[j]
df.empty = merge(x=df.empty,y=df.new,all=T)
}  

oweb.2014.applications = df.empty

reg1.apps = submit_form(oweb.session,oweb.form) %>%
  rvest::follow_link(,i = 'Current') %>%
  rvest::follow_link(,i = 'Region 1') 
setwd('/homes/tscott1/win/user/oweb2014_grants/reg1_files/')

reg1.links = reg1.apps %>% html_nodes('a')
reg1.links = reg1.links[intersect(grep('OWEB',rvest::xml_text(reg1.links),invert=T),
grep('OGMS',rvest::xml_text(reg1.links),invert=T))]
temp = rvest::xml_attrs(reg1.links)
partURL = 'http://apps.wrd.state.or.us/apps/oweb/fiscal/'

testurl = paste0(partURL,temp[[1]][1])
getwd()
download(url = testurl,destfile =
           gsub('=','',gsub('.*aspx.','',temp[[1]][1])))


rvest::xml_attrs(reg1.links)



library(downloader)

reg1.apps
reg1.links
source_url(url = test)


getURL(test)class(reg1.apps)
html(reg1.apps)
class(reg1.links)
test
test =  follow_link(reg1.apps,4)
install.packages('stringi')
guess_encoding(test)
)


download(follow_link(reg1.apps, i = 5))
    
            
            url = 
              paste0(partURL,temp[[1]][1])


download((paste0(partURL,temp[[1]][1])),
         gsub('.*aspx.','',temp[[1]][1]))

rvest::follow_link(x = reg1.apps,4)


http://apps.wrd.state.or.us/apps/oweb/fiscal/displaypdf.aspx?id=25920




download.file(,
              

testurl = paste0(partURL,temp[[1]][1])
download(url = paste0(partURL,temp[[1]][1]),destfile = 
           gsub('.*aspx.','',temp[[1]][1]))
paste0(partURL,temp[[1]][1])


for (j in 1:length(temp))
{
  jump_to(reg1.apps,url = paste0(partURL,temp[[j]][1])) 
}

download.file(url, destfile, method, quiet = FALSE, mode = "w",
              cacheOK = TRUE,
              extra = getOption("download.file.extra"))
download.file(paste0(partURL,temp[[1]][1]),
              destfile = gsub('.*aspx.','',temp[[1]][1]))
readLines(testurl)
url
library(RCurl)


  