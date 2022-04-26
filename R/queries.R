library(readr)
library(sqldf)
library(psych)
library(tidyverse)
library(tidyr)
library(purrr)

summary(netflix)
describe(netflix)
map(netflix, ~sum(is.na(.)))

netflix[is.na(netflix$rating),]

netflix$rating[68] <- 'TV-PG'
netflix$rating[2360] <- 'TV-14'
netflix$rating[3661] <- 'TV-MA'
netflix$rating[3739] <- 'TV-MA'
netflix$rating[3737] <- 'NR'
netflix$rating[3738] <- 'TV-MA'
netflix$rating[4324] <- 'TV-MA' 

netflix$director <- NULL
netflix$cast <- NULL
netflix <-subset(netflix, (!is.na(netflix[,5]) & !is.na(netflix[,4])))

sqldf('SELECT COUNT(DISTINCT country) FROM netflix')

netflix <- separate(netflix, country, into= " ", sep= ",")
colnames(netflix)[4] <- "country"

sqldf('SELECT COUNT (DISTINCT country) FROM netflix')

map(netflix, ~sum(is.na(.)))

sapply(netflix, class)

netflix <- separate(netflix, date_added, into= " ", sep= ",")
colnames(netflix)[5] <- "date_added"
netflix <- separate(netflix, date_added, into= " ", sep= " ")
colnames(netflix)[5] <- "date_added"

table(netflix$rating)
netflix$rating[netflix$rating == "TV-PG"] <- 'Older Kids'
netflix$rating[netflix$rating == "TV-MA"] <- 'Adults'
netflix$rating[netflix$rating == "TV-Y7-FV"] <- 'Older Kids'
netflix$rating[netflix$rating == "TV-Y7"] <- 'Older Kids'
netflix$rating[netflix$rating == "TV-14"] <- 'Teens'
netflix$rating[netflix$rating == "R"] <- 'Adults'
netflix$rating[netflix$rating == "TV-Y"] <- 'Kids'
netflix$rating[netflix$rating == "NR"] <- 'Adults'
netflix$rating[netflix$rating == "PG-13"] <- 'Teens'
netflix$rating[netflix$rating == "TV-G"] <- 'Kids'
netflix$rating[netflix$rating == "PG"] <- 'Older Kids'
netflix$rating[netflix$rating == "G"] <- 'Kids'
netflix$rating[netflix$rating == "UR"] <- 'Adults'
netflix$rating[netflix$rating == "NC-17"] <- 'Adults'

view(netflix)
