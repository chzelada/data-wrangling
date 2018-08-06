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

Query <- "SELECT  * FROM carlosmorales;"

hero <- dbGetQuery(mydb, Query)
#####

uno <- Dos <- "select name.publisher From heroes_information;"
hero <- dbGetQuery(mydb, Uno)

Dos <- "select DISTINCT publisher From heroes_information;"
hero <- dbGetQuery(mydb, Dos)
hero

 
tres <- "select COUNT(DISTINCT publisher) From heroes_information;"
hero <- dbGetQuery(mydb, tres)

cuatro <- "select * From heroes_information where Height > 200;"
hero <- dbGetQuery(mydb, cuatro)
hero

Cinco <- "select * From heroes_information where Race = 'Human';"
hero <- dbGetQuery(mydb, Cinco)
hero

Seis <- "select * From heroes_information where Race = 'Human'  and Height > 200;"
hero <- dbGetQuery(mydb, Seis)
hero

Siete <- "select * From heroes_information where Weight > 100 and Weight < 200;"
hero <- dbGetQuery(mydb, Seis)
hero



Ocho <- "select count(name) From heroes_information where `EYE color` = 'blue' or `EYE color` = 'red';"
hero <- dbGetQuery(mydb, Ocho)
hero


Nueve <- "select name, Weight, Height From heroes_information where Weight > 200 and Height > 100 order by Height DESC;"
hero <- dbGetQuery(mydb, Nueve)
hero

diez <- "select name, Race From heroes_information order by name, race;"
hero <- dbGetQuery(mydb, diez)
hero



Once <- "select Publisher, Alignment, Race, Count(name) From heroes_information where Alignment =  'good'
group by Publisher HAVING COUNT(Publisher) > 30 ;"
hero <- dbGetQuery(mydb, Once)
hero

















