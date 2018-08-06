library("RMySQL")

connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"

drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

#1
query = "SELECT name, publisher FROM heroes_information"

#2
query = "SELECT DISTINCT publisher FROM heroes_information"

#3
query = "SELECT COUNT(DISTINCT publisher) FROM heroes_information"

#4
query = "SELECT * FROM heroes_information WHERE height > 200"

#5
query = "SELECT * FROM heroes_information WHERE race = 'human'"

#6
query = "SELECT * FROM heroes_information WHERE race = 'human' AND height > 200"

#7
query = "SELECT COUNT(*) FROM heroes_information WHERE weight > 100 AND weight < 200"

#8
query = "SELECT Count(*) FROM heroes_information WHERE `Eye color`='blue' OR `Eye color`= 'red';"

#9
query = "SELECT COUNT(*) FROM heroes_information WHERE weight BETWEEN 100 AND 200"

#10
query = "SELECT name,weight,height FROM heroes_information WHERE weight > 200 AND height > 100 ORDER BY height DESC" 

#11
query = "SELECT name,race FROM heroes_information ORDER BY name,race"

#12
query = "SELECT Publisher, Alignment, Race, COUNT(name) FROM heroes_information WHERE Alignment = 'good'  GROUP BY Publisher HAVING COUNT(Publisher)>30;"

q = dbSendQuery(mydb,query)
hero = dbFetch(q)
hero