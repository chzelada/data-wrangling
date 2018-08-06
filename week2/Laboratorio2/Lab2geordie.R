mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

# Query 1
query <- "SELECT name, Publisher  FROM heroes_information ;"

# Query 2
query <- "SELECT DISTINCT Publisher  FROM heroes_information ;"

# Query 3
query <- "SELECT COUNT(DISTINCT Publisher)  FROM heroes_information ;"

# Query 4
query <- "SELECT *  FROM heroes_information WHERE Height > 200 ;"   

# Query 5
query <- "SELECT name  FROM heroes_information WHERE Race = 'Human' ;" # la instrucción no aparece en la diapositiva, pero si mal no recuerdo era algo asi   

# Query 6
query <- "SELECT name  FROM heroes_information WHERE Race = 'Human' and Height > 200;"

# Query 7
query <- "SELECT COUNT(*)  FROM heroes_information WHERE Weight >100  AND Weight < 200 ;"

# Query 8
query <- "SELECT *  FROM heroes_information WHERE (`Eye color` = 'blue') OR (`Eye color` = 'red');" 

# Query 9
query <- "SELECT COUNT(name)  FROM heroes_information WHERE Weight BETWEEN 100 AND 200 ;"

# Query 10
query <- "SELECT name, Weight, Height FROM heroes_information WHERE Weight > 200 AND Height > 100 ORDER BY 3 DESC ;"
query <- "SELECT name, Race  FROM heroes_information ORDER BY Name, Race;"

# Query 11
query <- "SELECT Publisher, Gender, COUNT(DISTINCT Gender), COUNT(Gender) FROM heroes_information GROUP BY Publisher ORDER BY 2, 3 ASC;" #No se hizo en lab

#Query 12
query <- "SELECT Publisher, Alignment, Race, COUNT(name) FROM heroes_information WHERE Alignment = 'good'  GROUP BY Publisher HAVING COUNT( Publisher ) > 30;"


#query2 <- "SELECT Publisher, Gender, COUNT(*) FROM heroes_information WHERE (Weight > 200 AND Height > 100) GROUP BY Height HAVING COUNT( Publisher ) > 30;"
#query2 <- "SELECT Name, Race  FROM heroes_information ORDER BY Name, Race;"
#query <- "SELECT COUNT(*)  FROM heroes_information WHERE Weight IN (1,3,5) ;"
#query <- "SELECT Publisher, Alignment, Race, COUNT(name) FROM heroes_information WHERE Alignment = 'good'  GROUP BY Publisher HAVING COUNT( Publisher ) > 30;"

hero <- dbGetQuery(mydb, query)
#hero <- dbGetQuery(mydb, query2)  

QUERY <- dbSendQuery(mydb, query)
#QUERY <- dbSendQuery(mydb, query2)

hero <- dbFetch(QUERY)


head(hero)

#dbGetRowCount(QUERY)

#rm(query, hero, QUERY)

dbClearResult(QUERY)

