https://gist.github.com/aravindhebbali/f2cc73794e9f9bfaa673

https://www.slideshare.net/RsquaredIn/rmysql-tutorial-for-beginners 


install.packages("RMySQL")
library(RMySQL)
connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")

mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)
summary(mydb)

Query= "EXPLAIN SELECT * FROM heroes_information limit 10;"
Query= "SELECT * FROM heroes_information limit 10;"

dbGetInfo(results)
results <- dbSendQuery(mydb, Query)

data_frame = fetch(results, n=-1)
data_frame

Making tables:
  We can create tables in the database using R dataframes.

dbWriteTable(mydb, name='table_name', value=data.frame.name)