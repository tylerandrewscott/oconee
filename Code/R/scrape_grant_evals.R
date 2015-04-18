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



oweb.session = rvest::html_session(url)
oweb.form <- html_form(oweb.session)[[1]]

oweb.form <- set_values(oweb.form, txtuser = "grantee",
                        txtpwd = 'oweb') 

regions = paste('Region',1:6)

temp = submit_form(oweb.session,oweb.form) %>%
  rvest::follow_link(,i = 'OGMS Search')  

search.form = html_form(temp)[[1]]
search.form = set_values(search.form,txtbegin='01/01/2013',txtend = '12/31/2013')

tempdat = submit_form(temp,search.form)
refdat = submit_form(temp,search.form) %>%
html() %>%
  html_table(header = T,trim = T,fill = T)
testid = refdat[[1]]$ID[1]

test = tempdat %>% html_nodes("a") %>% html_attr("href")
test = test[grep('grantdetail',test)][1]
html(tempdat)
tempdat %>% 
  
  follow_link(tempdat,test)





library(XML)
library(httr)
library(rvest)
library(magrittr)



# do the same the rvest way, using "html_session" since we may need connection info in some scripts
freak <- html_session("http://torrentfreak.com/top-10-most-pirated-movies-of-the-week-130304/")
html(freak)


oweb.session = rvest::html_session(url)
oweb.form <- html_form(oweb.session)[[1]]

oweb.form <- set_values(oweb.form, txtuser = "grantee",
                        txtpwd = 'oweb') 

regions = paste('Region',1:6)

temp = submit_form(oweb.session,oweb.form) %>%
  rvest::follow_link(,i = 'OGMS Search')  

search.form = html_form(temp)[[1]]
search.form = set_values(search.form,txtbegin='01/01/2013',txtend = '12/31/2013')

list = submit_form(temp,search.form)
html(list)
html(freak)


list %>% html_nodes(xpath="//*/td[3]/a[contains(@href,'oweb')]") %>%
 html_attr("href") %>% .[1:10]

main.page <- html(list)
urls <- main.page %>% # feed `main.page` to the next step
  html_nodes(".ver12 a") %>% # get the CSS nodes
  html_attr("href") # extract the URLs

link.list = html(list) %>% html_nodes('a') %>% html_attr('href')
which.links = grep('whichgrantdetail',link.list)


linktest = list %>% follow_link(,i=which.links[1])

html(linktest)


xpathSApply(freak_html, "//*/td[4]/a[contains(@href,'imdb')]", xmlAttrs, "href")


# extracting with rvest + XPath
freak %>% html_nodes(xpath="//*/td[4]/a[contains(@href,'grantdetail')]") %>% html_attr("href") %>% .[1:10]





# setup connection & grab HTML the "old" way w/httr
freak_get <- GET("http://torrentfreak.com/top-10-most-pirated-movies-of-the-week-130304/")
freak_html <- htmlParse(content(freak_get, as="text"))
xpathSApply(freak_html, "//*/td[4]/a[contains(@href,'imdb')]", xmlAttrs, "href")
# do the same the rvest way, using "html_session" since we may need connection info in some scripts
freak <- html_session("http://torrentfreak.com/top-10-most-pirated-movies-of-the-week-130304/")

# extracting the "old" way with xpathSApply
xpathSApply(freak_html, "//*/td[3]", xmlValue)[1:10]

##  [1] "Silver Linings Playbook "           "The Hobbit: An Unexpected Journey " "Life of Pi (DVDscr/DVDrip)"        
##  [4] "Argo (DVDscr)"                      "Identity Thief "                    "Red Dawn "                         
##  [7] "Rise Of The Guardians (DVDscr)"     "Django Unchained (DVDscr)"          "Lincoln (DVDscr)"                  
## [10] "Zero Dark Thirty "

xpathSApply(freak_html, "//*/td[1]", xmlValue)[2:11]

##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"

xpathSApply(freak_html, "//*/td[4]", xmlValue)

##  [1] "7.4 / trailer" "8.2 / trailer" "8.3 / trailer" "8.2 / trailer" "8.2 / trailer" "5.3 / trailer" "7.5 / trailer"
##  [8] "8.8 / trailer" "8.2 / trailer" "7.6 / trailer"

xpathSApply(freak_html, "//*/td[4]/a[contains(@href,'imdb')]", xmlAttrs, "href")

##                                    href                                    href                                    href 
##  "http://www.imdb.com/title/tt1045658/"  "http://www.imdb.com/title/tt0903624/"  "http://www.imdb.com/title/tt0454876/" 
##                                    href                                    href                                    href 
##  "http://www.imdb.com/title/tt1024648/"  "http://www.imdb.com/title/tt2024432/"  "http://www.imdb.com/title/tt1234719/" 
##                                    href                                    href                                    href 
##  "http://www.imdb.com/title/tt1446192/"  "http://www.imdb.com/title/tt1853728/"  "http://www.imdb.com/title/tt0443272/" 
##                                    href 
## "http://www.imdb.com/title/tt1790885/?"

# extracting with rvest + XPath
freak %>% html_nodes(xpath="//*/td[3]") %>% html_text() %>% .[1:10]

##  [1] "Silver Linings Playbook "           "The Hobbit: An Unexpected Journey " "Life of Pi (DVDscr/DVDrip)"        
##  [4] "Argo (DVDscr)"                      "Identity Thief "                    "Red Dawn "                         
##  [7] "Rise Of The Guardians (DVDscr)"     "Django Unchained (DVDscr)"          "Lincoln (DVDscr)"                  
## [10] "Zero Dark Thirty "

freak %>% html_nodes(xpath="//*/td[1]") %>% html_text() %>% .[2:11]

##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10"

freak %>% html_nodes(xpath="//*/td[4]") %>% html_text() %>% .[1:10]
html(freak)


##  [1] "7.4 / trailer" "8.2 / trailer" "8.3 / trailer" "8.2 / trailer" "8.2 / trailer" "5.3 / trailer" "7.5 / trailer"
##  [8] "8.8 / trailer" "8.2 / trailer" "7.6 / trailer"

freak %>% html_nodes(xpath="//*/td[4]/a[contains(@href,'imdb')]") %>% html_attr("href") %>% .[1:10]
