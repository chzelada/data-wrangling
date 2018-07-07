#### References
#### http://r4ds.had.co.nz/lists.html
#### https://jennybc.github.io/purrr-tutorial/ls01_map-name-position-shortcuts.html


library(httr)
library(curl)
library(jsonlite)
library(purrr)
client_id = Sys.getenv("CLIENT_ID")
client_secret = Sys.getenv("CLIENT_SECRET")


id_secret <- RCurl::base64(paste(client_id,client_secret,sep=':'))[[1]]

my_headers <- httr::add_headers(c(Authorization=paste('Basic', id_secret,sep=' ')))

my_body <- list(grant_type='client_credentials')

my_token <- httr::content(httr::POST('https://accounts.spotify.com/api/token', my_headers,body=my_body,encode='form'))

#### Find Artist ####
auth_header <- httr::add_headers('Authorization'= paste('Bearer',my_token$access_token))
url <- "https://api.spotify.com/v1/search"
artist <- URLencode("Luis Miguel")
artist_info <- httr::content( httr::GET(paste(url,'?q=',artist,'&type=artist',sep=''),auth_header))

map_chr(artist_info$artists$items,c("name"))
map(artist_info$artists$items,"followers") %>% map_int("total")
map(artist_info$artists$items,"genres") %>% map_chr(paste,collapse=",")

#### Find Track ####

url <- "https://api.spotify.com/v1/search"
artist <- URLencode("Luis Fonsi")
track_info <- httr::content( httr::GET(paste(url,'?q=',artist,'&type=track&market=US',sep=''),auth_header))

track_info$tracks$items[[1]]$id
artist_info$artists$items[[1]]$name
artist_info$artists$items[[1]]$genres
artist_info$artists$items[[1]]$id


### Audio Feature ###
auth_header <- httr::add_headers('Authorization'= paste('Bearer',my_token$access_token))

track_id <- "6rPO02ozF3bM7NnOV4h6s2"

af <- httr::content( httr::GET(paste('https://api.spotify.com/v1/audio-features/',track_id,sep=''),auth_header))

str(af)





#### Audio Analisys ####

auth_header <- httr::add_headers('Authorization'= paste('Bearer',my_token$access_token))
audio_analisis <- httr::content( httr::GET('https://api.spotify.com/v1/audio-analysis/6rPO02ozF3bM7NnOV4h6s2',auth_header))

audio_analisis$bars
