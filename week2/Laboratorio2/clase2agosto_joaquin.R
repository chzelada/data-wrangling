library(RMySQL)

##parametros para conexion 
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

###probar conexion

summary(mydb)

hero <- dbReadTable(mydb, "heroes_information")
hero
head(hero)

Query <- "SELECT DISTINCT Publisher from heroes_information;"
hero <- dbGetQuery(mydb, Query)
hero
##CONTAR
Query<- "SELECT COUNT(DISTINCT Publisher) FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)
hero
###WHERE FILTRO
Query<- "SELECT * FROM heroes_information WHERE Height>200;"
hero <- dbGetQuery(mydb, Query)
hero
Query<-"SELECT * FROM heroes_information WHERE Race = 'Human';"
hero <- dbGetQuery(mydb, Query)
hero
####WHERE FILTRO CON AND
Query<-"SELECT * FROM heroes_information WHERE Race = 'Human' AND Height>200;"
hero <- dbGetQuery(mydb, Query)
hero
Query<-"SELECT COUND(*) FROM heroes_information WHERE Weight >100 AND Weight<200;"
hero <- dbGetQuery(mydb, Query)
hero
####CUANDO HAY UN ESPACIO SE USA ESTE SIMBOLO EN EL NOMBRE DE LA COLUMNA `` ABAJO DE ESC
Query<-"SELECT COUNT(*) FROM heroes_information WHERE `Eye color` = 'blue' OR `Eye color` = 'red';"
hero <- dbGetQuery(mydb, Query)
hero

Query<-"SELECT COUNT(*) FROM heroes_information WHERE `Eye color` = 'blue' OR `Eye color` = 'red';"
hero <- dbGetQuery(mydb, Query)
hero
Query<-"SELECT COUNT(*) FROM heroes_information WHERE Weight BETWEEN 100 AND 200;"
hero <- dbGetQuery(mydb, Query)
hero
Query<-"SELECT Name, Weight, Height FROM heroes_information WHERE Weight >200 AND Height >100  ORDER BY Height DESC;"
hero <- dbGetQuery(mydb, Query)
hero
Query<-"SELECT Name, Race FROM heroes_information  ORDER BY Name, Race ;"
hero <- dbGetQuery(mydb, Query)
hero
Query<-"SELECT Publisher, Alignment, Race FROM heroes_information WHERE Alignment='good' GROUP BY Publisher HAVING COUNT(Publisher) > 30;"
hero <- dbGetQuery(mydb, Query)
hero
