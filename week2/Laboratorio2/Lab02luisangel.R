##### LUIS ANGEL TORTOLA - 20160582

library(RMySQL)

connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

# resumen de conexion
summary(mydb)

hero <- dbReadTable(mydb, "heroes_information")
head(hero)
dbListFields(mydb, "heroes_information")

# Ej 1
query <- "SELECT DISTINCT name, Publisher 
          FROM heroes_information;"

hero <- dbGetQuery(mydb, query)
hero


# Ej 2
query <- "SELECT DISTINCT Publisher 
          FROM heroes_information;"

hero <- dbGetQuery(mydb, query)
hero

# Ej 3
query <- "SELECT COUNT(DISTINCT Publisher)
          FROM heroes_information;"

hero <- dbGetQuery(mydb, query)
hero

# Ej 4
query <- "SELECT * 
          FROM heroes_information
          WHERE Height > 200;"

hero <- dbGetQuery(mydb, query)
hero

# Ej 5
query <- "SELECT * 
          FROM heroes_information
          WHERE Race = 'Human;"

hero <- dbGetQuery(mydb, query)
hero

# Ej 6
query <- "SELECT * 
          FROM heroes_information
          WHERE Race = 'Human'
          AND Height > 200;"

hero <- dbGetQuery(mydb, query)
hero

# Ej 7
query <- "SELECT COUNT(*)
          FROM heroes_information
          WHERE Weight < 200
          AND Weight > 100;"

hero <- dbGetQuery(mydb, query)
hero

# Ej 8
eyes <- "Eye color"

query <- "SELECT COUNT(*) 
          FROM heroes_information
          WHERE `Eye color` = 'blue' OR `Eye color` = 'red';"

hero <- dbGetQuery(mydb, query)
hero

# Ej 9
eyes <- "Eye color"

query <- "SELECT COUNT(*) 
          FROM heroes_information
          WHERE Weight BETWEEN 100 AND 200"

hero <- dbGetQuery(mydb, query)
hero


query <- "SELECT COUNT(*) 
          FROM heroes_information
          WHERE Weight IN (1, 2, 3, 4, 5)"

hero <- dbGetQuery(mydb, query)
hero


# Ej 10
query <- "SELECT name, Weight, Height
          FROM heroes_information
          WHERE Weight > 200 AND Height > 100
          ORDER BY Height DESC"

hero <- dbGetQuery(mydb, query)
hero

# Ej 11
query <- "SELECT name, Race
          FROM heroes_information
          ORDER BY name, Race"

hero <- dbGetQuery(mydb, query)
hero

# Ej 12
query <- "SELECT Name, Publisher, Alignment, Race
          FROM heroes_information
          WHERE Alignment = 'good'
          GROUP BY Publisher
          HAVING COUNT(Publisher) > 30;"

hero <- dbGetQuery(mydb, query)
hero



