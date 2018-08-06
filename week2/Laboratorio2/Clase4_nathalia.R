##parametros para conexion 
library(RMySQL)
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

hero <- dbReadTable(mydb, "heroes_information")

#Ejercicio 1
Query <- "SELECT name, Publisher FROM heroes_information;"

#Ejercicio 2
Query <- "SELECT DISTINCT Publisher FROM heroes_information;"

#Ejercicio 3
Query <- "SELECT COUNT(DISTINCT Publisher) FROM heroes_information;"

#Ejercicio 4 y 5
Query <- "SELECT * FROM heroes_information WHERE Height>200;"

#Ejercicio 6 y 7
Query <- "SELECT * FROM heroes_information WHERE Race='Human' AND Height>200;"
Query <- "SELECT COUNT(*) FROM heroes_information WHERE Weight>100 AND Weight<200;"

#Ejercicio 8
Query <- "SELECT COUNT(*) FROM heroes_information WHERE `Eye color`='blue' OR `Eye color`='red';"

#Ejercicio 9
Query <- "SELECT COUNT(*) FROM heroes_information WHERE Weight BETWEEN 100 AND 200;"

#Ejercicio 10
Query <- "SELECT name, Weight, Height FROM heroes_information WHERE Weight>200 AND Height>100 ORDER BY Height DESC;"
Query <- "SELECT name, race FROM heroes_information ORDER BY name, race;"

#Ejercicio 11
Query <- "SELECT COUNT(gender='female'), Publisher, gender FROM heroes_information GROUP BY Publisher ORDER BY COUNT(gender='female');"

#Ejercicio 12 GROUP BY / HAVING 'COUNT()'
Query <- "SELECT COUNT(name), Publisher, Alignment, race FROM heroes_information WHERE Alignment='good' GROUP BY   Publisher HAVING COUNT(Publisher) > 30;"

hero <- dbGetQuery(mydb, Query)
query <- dbSendQuery(mydb, Query)
hero

dbClearResult(query)

