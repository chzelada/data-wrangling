library(dplyr)
library(RMySQL)
setwd("~/GitHub/data-wrangling/week2/Laboratorio2")

connection_name <- "dstrackdb.cwvcmlr71hlu.us-east-1.rds.amazonaws.com"
db_name <- "data_wrangling"
user <- "dstrack"
password <- "4es-27c-CdV-TEe"
drv = dbDriver("MySQL")
mydb = dbConnect(drv,host=connection_name,dbname=db_name,user=user,pass=password)

revision <- function(q1=NULL,q2=NULL,q3=NULL,q4=NULL,q5=NULL,q6=NULL,q7=NULL,q8=NULL,q9=NULL,q10=NULL,q11=NULL,q12=NULL,mydb=NULL){
  if(is.null(q1)==FALSE && nrow(q1)==734 && names(q1)[1]=="name" && names(q1)[2]%in%c("Publisher", "publisher")){print("Query 1: APPROVED ")} else {print("Query 1: FAILED (a)")}
  if(is.null(q2)==FALSE && nrow(q2)==25){print("Query 2: APPROVED")} else {print("Query 2: FAILED (b)")}
  if(is.null(q3)==FALSE && q3==25){print("Query 3: APPROVED")} else {print("Query 3: FAILED (c)")}
  if(is.null(q4)==FALSE && nrow(q4)==59 && q4$Weight>200){print("Query 4: APPROVED")} else {print("Query 4: FAILED (d)")}
  if(is.null(q5)==FALSE && nrow(q5)==208 && q5$Race=="Human"){print("Query 5: APPROVED")} else {print("Query 5: FAILED (e)")}
  if(is.null(q6)==FALSE && nrow(q6)==12 && q6$Height>200 && q6$Race=="Human"){print("Query 6: APPROVED")} else {print("Query 6: FAILED (f)")}
  if(is.null(q7)==FALSE && q7==98){print("Query 7: APPROVED")} else {print("Query 7: FAILED (g)")}
  if(is.null(q8)==FALSE && q8==271){
    print("Query 8: APPROVED")} else {
      print("Query 8: FAILED (h)")}
  if(is.null(q9)==FALSE && q9==98){print("Query 9: APPROVED")} else {print("Query 9: FAILED (i)")}
  if(is.null(q10)==FALSE && names(q10)[1]=="name" && names(q10)[2]%in%c("Weight", "weight") && names(q10)[3]%in%c("Height", "height") && nrow(q10)==50 && (q10$height[1]==max(q10$height)||q10$Height[1]==max(q10$Height))){
    print("Query 10: APPROVED")} else {
      print("Query 10: FAILED (j)")}
  if(is.null(q11)==FALSE && names(q11)[1]=="name" && names(q11)[2]%in%c("Race", "race") && nrow(q11)==734 && q11$name[1]==min(q11$name)){
    print("Query 11: APPROVED")} else {
      print("Query 11: FAILED (k)")}
  if(is.null(q12)==FALSE && nrow(q12)==2 && q12$`COUNT(name)`[1]==142 && q12$`COUNT(name)`[2]==259){
    print("Query 12: APPROVED")} else {
      print("Query 12: FAILED (l)")}
  dbDisconnect(mydb)
}

dbListFields(mydb, "heroes_information")

a<-dbGetQuery(mydb, "SELECT name, Publisher FROM heroes_information")
b<-dbGetQuery(mydb, "SELECT DISTINCT(Publisher) FROM heroes_information")
c<-dbGetQuery(mydb, "SELECT COUNT(DISTINCT(Publisher)) FROM heroes_information")
d<-dbGetQuery(mydb, "SELECT * FROM heroes_information WHERE height>200")
e<-dbGetQuery(mydb, "SELECT * FROM heroes_information WHERE Race='Human'")
f<-dbGetQuery(mydb, "SELECT * FROM heroes_information WHERE Race='Human' AND Height>200")
g<-dbGetQuery(mydb, "SELECT COUNT(name) FROM heroes_information WHERE Weight>100 AND Weight<200")
h<-dbGetQuery(mydb, "SELECT * FROM heroes_information WHERE `Eye color`='red' OR `Eye color`='blue'")
i<-dbGetQuery(mydb, "SELECT COUNT(name) FROM heroes_information WHERE Weight BETWEEN 100 AND 200")
j<-dbGetQuery(mydb, "SELECT name, Weight, Height FROM heroes_information WHERE Weight>200 AND Height>100 ORDER BY Height DESC")
k<-dbGetQuery(mydb, "SELECT name, Race FROM heroes_information ORDER BY name, Race")
l<-dbGetQuery(mydb, "SELECT COUNT(name), Publisher, Alignment, Race FROM heroes_information WHERE Alignment='good' GROUP BY publisher HAVING COUNT(Publisher)>30")

#Para eliminar conexiones

killDbConnections <- function () {
  
  all_cons <- dbListConnections(MySQL())
  
  print(all_cons)
  
  for(con in all_cons)
    +  dbDisconnect(con)
  
  print(paste(length(all_cons), " connections killed."))
  
}
  
  
  
  
