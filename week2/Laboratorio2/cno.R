#Rodrigo Cano - 20150025 | Lab 2

#Installing Packages

install.packages("RMySQL")
library(RMySQL)

#Connection Parameters
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

summary(mydb)

#Query Challenge

dbListTables(mydb)
dbListFields(mydb,"heroes_information")

#CH1 query = "SELECT name, publisher FROM heroes_information"
#CH2 query = "SELECT DISTINCT publisher FROM heroes_information"
#CH3 query = "SELECT COUNT(DISTINCT publisher) FROM heroes_information"
#CH4 query = "SELECT * FROM heroes_information WHERE height > 200"
#CH5 query = "SELECT * FROM heroes_information WHERE race = 'human'"
#CH6 query = "SELECT * FROM heroes_information WHERE race = 'human' AND height > 200"
#CH7 query = "SELECT COUNT(*) FROM heroes_information WHERE weight > 100 AND weight < 200"
#CH8 query = "SELECT COUNT(*) FROM heroes_information WHERE `Eye color` = 'blue' OR `Eye color` = 'red'"
#CH9 query = "SELECT COUNT(*) FROM heroes_information WHERE weight BETWEEN 100 AND 200"
#CH10 query = "SELECT name,weight,height FROM heroes_information WHERE weight > 200 AND height > 100 ORDER BY height DESC" 
#CH11 query = "SELECT name,race FROM heroes_information ORDER BY name,race"

query = "SELECT COUNT(name),publisher,alignment,race FROM heroes_information WHERE alignment = 'good' GROUP BY publisher HAVING COUNT(publisher) > 30" 

query_get <- dbGetQuery(mydb,query)

View(query_get)

