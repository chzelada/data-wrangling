install.packages("RMySQL")
library(RMySQL)

##parametros para conexion 
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

summary(mydb)

dbListTables(mydb)


Query <- "SELECT  * FROM heroes_information;"
heroin <- dbGetQuery(mydb, Query)
head(heroin)

#1
Query <- "SELECT  Name,Publisher FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)

#2
Query <- "SELECT DISTINCT publisher FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)


Query <- "SELECT COUNT(publisher) FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)

#3
Query <- "SELECT COUNT(DISTINCT publisher) FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)


#wHERE =  <>NOT EQUAL  <  >  <=  >=
Query <- "SELECT PUblisher FROM heroes_information WHERE PUblisher='DC Comics';"
hero <- dbGetQuery(mydb, Query)


#4
Query <- "SELECT * FROM heroes_information WHERE Height>200;"
hero <- dbGetQuery(mydb, Query)


#5
Query <- "SELECT * FROM heroes_information WHERE Race='Human';"
hero <- dbGetQuery(mydb, Query)

# Where field=x AND field2=y
head(heroin)

#6 y 7
Query <- "SELECT * FROM heroes_information WHERE Race='Human' AND Height>200 ;"
hero <- dbGetQuery(mydb, Query)
Query <- "SELECT * FROM heroes_information WHERE Weight>100 AND Weight<200 ;"
hero <- dbGetQuery(mydb, Query)


#Where and or    where (x or y) AND (x or y)

#8
Query <- "SELECT COUNT(name) FROM heroes_information WHERE `EYE color`='blue' OR `EYE color`='red' ;"
hero <- dbGetQuery(mydb, Query)


#Between -  IN Where x BETWEEN 1 AND 5;    WHERE X IN (2,4,5);    BETWEEN es inclusivo, en R se usa %IN%
#9
Query <- "SELECT COUNT(name) FROM heroes_information WHERE Weight BETWEEN 100 AND 200 ;"
hero <- dbGetQuery(mydb, Query)

#Order by  from table order by x,y; (ascendente default)   from table order by x DESC;

# 10 y 11
Query <- "SELECT name,Weight,Height FROM heroes_information WHERE Weight>200 AND Height>100 ORDER BY Height DESC;"
hero <- dbGetQuery(mydb, Query)

Query <- "SELECT name,Race FROM heroes_information ORDER BY Name, Race;"
hero <- dbGetQuery(mydb, Query)

#group by SELECT fields COUNT(*) FROM table GROUP BY field HAVING COUNT(field)>100;
# 12
Query <- "SELECT Publisher,Alignment,Race, COUNT(name) FROM heroes_information WHERE Alignment='good' GROUP BY Publisher HAVING COUNT(Publisher)>30;"
hero <- dbGetQuery(mydb, Query)




