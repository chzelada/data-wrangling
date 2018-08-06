library(RMySQL)
install.packages("RMySQL")
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL()")
mydb = dbConnect(MySQL(),host=connection_name,dbname=db_name,user=user,pass=password)

dbListTables(mydb)


##EJERCICIO 1
ejercicio1 <- dbGetQuery(mydb,"select name, Publisher  from heroes_information")
ejercicio1

##EJERCICIO 2
ejercicio2 <- dbGetQuery(mydb,"select distinct Publisher  from heroes_information")
ejercicio2

##EJERCICIO 3
ejercicio3 <- dbGetQuery(mydb,"select count(distinct Publisher)  from heroes_information")
ejercicio3

##EJERCICIO 4 y 5
ejercicio45 <- dbGetQuery(mydb,"select *  from heroes_information where height>200")
ejercicio45

##EJERCICIO 6
ejercicio6 <- dbGetQuery(mydb,"select *  from heroes_information where height>200 and race='Human'")
ejercicio6

##EJERCICIO 7
ejercicio7 <- dbGetQuery(mydb,"select count(*)  from heroes_information where weight>100 and weight<200")
ejercicio7

##EJERCICIO 8
ejercicio8 <- dbGetQuery(mydb,"select count(*) from heroes_information where `Eye color` = 'blue' or `Eye color` = 'red'")
ejercicio8

##EJERCICIO 9
ejercicio9 <- dbGetQuery(mydb,"select count(*) from heroes_information where weight between 100 and 200")
ejercicio9

##EJERCICIO10
ejercicio10A <- dbGetQuery(mydb,"select name, weight, height from heroes_information where weight>200 and height>100 order by height desc")
ejercicio10A

ejercicio10B <- dbGetQuery(mydb,"select name, race from heroes_information order by name,race")
ejercicio10B

##EJERCICIO11
ejercicio11 <- dbGetQuery(mydb,"select publisher, gender,count(*) as cuenta from heroes_information where gender='female' group by publisher order by cuenta desc ")
ejercicio11

##EJERCICIO12
ejercicio12 <- dbGetQuery(mydb,"select publisher, alignment,race, count(*) as cuenta from heroes_information where alignment='good' group by publisher having count(publisher)>30 ")
ejercicio12


 



