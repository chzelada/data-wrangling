install.packages("RMySQL")
library(RMySQL)
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)
summary(mydb)
tablas <- dbListTables(mydb)

heroes <- 'heroes_information'
dbListFields(mydb, heroes)
dbColumnInfo(mydb, heroes)
dbReadTable(mydb, heroes)
head(heroes)
str(heroes)
var1 <- '*'
var3 <-  'Height'
var4 <- '200'
signo <- ' > '
var5 <- 'Human'
#1 Query = paste("SELECT name, Publisher FROM heroes_information;")
#2 Query <- paste("SELECT DISTINCT Publisher"," FROM ", heroes, ";", sep = "")
#3 Query <- paste("SELECT COUNT(DISTINCT Publisher) FROM ", heroes, ";", sep = "")
#4 Query <- paste("SELECT * FROM ", heroes, " WHERE ", var3, signo, var4,";", sep = "")
#5 Query <- paste("SELECT * FROM heroes_information WHERE Race = 'human';")
#6 Query <- paste("SELECT * FROM heroes_information WHERE Race = 'human' AND Height > 200;")
#7 Query <- paste("SELECT * FROM heroes_information WHERE Weight > 100 AND Weight < 200;")
#8 Query <- paste("SELECT COUNT(*) FROM heroes_information WHERE `Eye color` = 'blue' OR `Eye color` = 'red';")
#9 Query <- paste("SELECT COUNT(*) FROM heroes_information WHERE weight BETWEEN 100 AND 200;")
#10 Query <- paste("SELECT DISTINCT name, Race FROM ",heroes, " ORDER BY name, Race;")
#10 Query <- paste("SELECT DISTINCT name, Weight, Height FROM ",heroes, " WHERE Weight>200 AND Height>100 ORDER BY height DESC;")
#11 Query <- paste("SELECT COUNT(DISTINCT Gender, Publisher) FROM heroes_information WHERE `Gender` = 'Female' GROUP BY Publisher DESC;")
#12 Query <- paste("SELECT COUNT(name),publisher,alignment,race FROM heroes_information WHERE alignment = 'good' GROUP BY publisher HAVING COUNT(publisher) > 30;")

hero <- dbGetQuery(mydb, Query)
query <- dbSendQuery(mydb,Query)
hero <- dbFetch(query,n=10)
dbGetInfo(query)
hero
dbClearResult(query)

