library(RMySQL)
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)
dbListFields(mydb, "heroes_information")

#1
dbGetQuery(mydb, "SELECT name,publisher from heroes_information;")

#2
dbGetQuery(mydb,"SELECT DISTINCT publisher from heroes_information;")

#3
dbGetQuery(mydb, "SELECT COUNT(DISTINCT publisher) from heroes_information;")

#4
dbGetQuery(mydb, "SELECT * from heroes_information WHERE height>200;")

#5
dbGetQuery(mydb, "SELECT * from heroes_information WHERE race='human';")

#6
dbGetQuery(mydb, "SELECT * from heroes_information WHERE race='human' AND height>200;")

#7
dbGetQuery(mydb, "SELECT COUNT(*) from heroes_information WHERE weight>100 AND weight<200;")

#8
dbGetQuery(mydb, "SELECT COUNT(*) from heroes_information WHERE `eye color`='blue' or `eye color`='red';")

#9
dbGetQuery(mydb, "SELECT COUNT(*) from heroes_information WHERE weight BETWEEN 100 and 200;")

#10
dbGetQuery(mydb, "SELECT name, weight, height from heroes_information WHERE weight>200 and height>100 ORDER BY height DESC;")

#11
dbGetQuery(mydb, "SELECT name, race from heroes_information ORDER BY name, race;")

#12
dbGetQuery(mydb, "SELECT count(*) name, publisher, alignment, race from heroes_information WHERE alignment='good' GROUP BY publisher HAVING COUNT(publisher)>30;")


