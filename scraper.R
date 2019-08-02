#install.packages("rvest")
#install.packages("httr")
library(rvest)
library(httr)
# add regexing to make sure its a url
#apparently readLine is interactive mode only

readURL <- function(){


}

getHTML <- function(){

mysesh <- html_session()
response <- mysesh$response
status_code(mysesh)

}
