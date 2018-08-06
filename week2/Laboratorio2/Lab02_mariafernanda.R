#' @title Lab02: SQL crash course (queries)
#' @author 20180190 Fernanda González
#' entregable: .r y queries

#' query: solicitud de datos
#' no son case sensitive pero buena práctica:
#' SELECT field
#' FROM table

#'  Parámetros para conexión
library("RMySQL")
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")
mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)
hero <- dbReadTable(mydb, "heroes_information")
View(hero)
head(hero)

#' ej 1: select name y publisher
Query <- "SELECT name, publisher FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)

#' ej 2: select distinct
Query <- "SELECT DISTINCT publisher FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)
head(hero)

#' ej 3: count cuenta número de filas en un query
#' combinable con distinct
Query <- "SELECT COUNT(DISTINCT publisher) FROM heroes_information;"
hero <- dbGetQuery(mydb, Query)
head(hero)

#' FILTRAR RESULTADOS
#' =, <>, '', <, >=
#' SELECT *
#' FROM
#' WHERE
#' AND

#' ej 4: WHERE permite filtrar basado en texto y valores numéricos
Query <- "SELECT * FROM heroes_information WHERE height>=200;"
hero <- dbGetQuery(mydb, Query)
head(hero)

#' ej 5:
Query <- "SELECT * FROM heroes_information WHERE race='human';"
hero <- dbGetQuery(mydb, Query)
head(hero)

#' ej 6: 
Query <- "SELECT * FROM heroes_information WHERE race='human' AND height>100 AND height<200;"
hero <- dbGetQuery(mydb, Query)
head(hero)

#' ej 7: 
Query <- "SELECT COUNT(*) FROM heroes_information WHERE height>100 AND height<200;"
hero <- dbGetQuery(mydb, Query)
head(hero)

#' SELECT *
#' FROM table
#' WHERE field
#' OR field
#' 
#' SELECT *
#' FROM table
#' WHERE (field OR field)
#' AND (field OR field)

#' ej 8: 
Query <- "SELECT COUNT(*) 
FROM heroes_information 
WHERE `Eye color`='red'
OR `Eye color`='blue';"
hero <- dbGetQuery(mydb, Query)
View(hero)

#' BETWEEN / IN: permite buscar dentro de un rango
#' es inclusivo
#' SELECT *
#' FROM table
#' WHERE field
#' BETWEEN x and y; / IN (x,y,z);

#' ej 9:
Query <- "SELECT COUNT(*) 
FROM heroes_information 
WHERE weight
BETWEEN 100 AND 200;"
hero <- dbGetQuery(mydb, Query)
View(hero)

#' ORDER BY: los ordena por un campo específico
#' ascendente por default
 
#' ej 10:
Query <- "SELECT name, weight, height 
FROM heroes_information 
WHERE weight>200
AND height>100
ORDER BY height
DESC;"
hero <- dbGetQuery(mydb, Query)
View(hero)

Query <- "SELECT name, race 
FROM heroes_information 
ORDER BY name, race;"
hero <- dbGetQuery(mydb, Query)
View(hero)

#' HAVING
#' WHERE no se puede usar al momento de hacer una agregación
#' sirve para filtrar por agregación
#' SELECT fields
#' COUNT(*)
#' FROM table
#' GROUP BY field
#' HAVING COUNT(field)>100;

#' ej 12:
Query <- "SELECT COUNT(name), publisher, alignment, race
FROM heroes_information
WHERE alignment='good'
GROUP BY publisher
HAVING COUNT(publisher)>30"
hero <- dbGetQuery(mydb, Query)
View(hero)