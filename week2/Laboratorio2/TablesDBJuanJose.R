library(RMySQL)
##parametros para conexion 
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)
##validar la conexion
summary(mydb)
##listar las tablas de DB
dbListTables(mydb)
##listar campos de una DB
dbListFields(mydb,"heroes_information")
#explicar columnas 
dbColumnInfo(mydb,"heroes_information")
hero<-dbReadTable(mydb,"heroes_information")
head(hero)
str(hero)



##Crear una tabla
x<-1:10
y<-letters[1:10]
cartagena<-data.frame(x,y,stringsAsFactors = FALSE)
dbWriteTable(mydb,"cartagena",jcartagena)
##sobreescribir
x<-sample(100,10)
y<-letters[11:20]
jcartagena2<-data.frame(x,y,stringsAsFactors = FALSE)
dbWriteTable(mydb,"cartagena",jcartagena2, overwrite=TRUE)
##agregar data a la tabla
x<-sample(100,10)
y<-letters[6:15]
jcartagena3<-data.frame(x,y,stringsAsFactors = FALSE)
dbWriteTable(mydb,"cartagena",jcartagena3, append=TRUE)

##Seleccionar datos
Query<-"SELECT name, publisher FROM heroes_information;"
hero<-dbGetQuery(mydb,Query)
hero
## Casas publicadas distintas
Query<-"SELEct DISTINCT publisher FROM heroes_information;"
hero<-dbGetQuery(mydb,Query)
hero
## Casas # publicadas distintas
Query<-"SELEct COUNT(DISTINCT publisher) FROM heroes_information;"
hero<-dbGetQuery(mydb,Query)
hero
## filtrar datps
Query<-"SELEct * FROM heroes_information WHERE height>=200;"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELEct * FROM heroes_information WHERE race='Human';"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELEct * FROM heroes_information WHERE race='Human' AND height>200;"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELEct COUNT(*) FROM heroes_information WHERE weight>100 AND weight<200;"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELECT COUNT(*) FROM heroes_information WHERE `eye color`='blue' OR `eye color`='red';"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELECT COUNT(*) FROM heroes_information WHERE weight BETWEEN 100 AND 200;"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELECT name, weight, height FROM heroes_information WHERE weight>200 AND height>100 ORDER BY height DESC;"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELECT name, race FROM heroes_information ORDER BY name, race;"
hero<-dbGetQuery(mydb,Query)
hero
Query<-"SELECT publisher, alignment, race FROM heroes_information WHERE alignment='good' GROUP BY publisher HAVING COUNT(publisher>30);"
hero<-dbGetQuery(mydb,Query)
hero