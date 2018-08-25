library(readr)
players_score <-read_csv("./Documents/Yiyo/UFM/6toSemestre/DataWrangling/ClaseMundial/Players_Score.csv")
view(players_score)


library(tidyverse)

players_score$cambio<-str_extract_all(players_score$Apps, "\\([^)]*\\)","")
players_score$cambio<-str_extract_all(players_score$cambio,"[0-9]+")
players_score$Apps<-str_replace_all(players_score$Apps, "\\([^)]*\\)","")

numbers <-c("age","Apps","Goals","Assists","Yel","Red","SpG","PS","AerialsWon","MotM","Rating")


players_score[is.na(players_score)] <- 0
players_score[numbers] <- players_score[numbers] %>%
  replace_na(list(age=0,Goals=0,Assist=0,Yel=0,Red=0,SpG=0,PS=0,AerialsWon=0,MotM=0, Rating=0))

filter(players_score,club=="Real Madrid", age<30)
filter(players_score,club %in% c("Real Madrid","Barcelona"), age <30)

###usando pipe operator
players_score %>%
  filter(club=="Real Madrid", age<30)  

##

players_score %>%
  filter(Goals>0)%>%
  select(Mins,Goals,player)%>%
  mutate(Goal_Rate=Goals/Mins)%>%
  arrange(desc(Goal_Rate))

### Tabla por goles por equipo
players_score%>%
  select(club,Goals)%>%
  group_by(club)%>%
  summarise(team_goals=sum(Goals))%>%
  arrange(desc(team_goals))

###   Mejor jugador y porcentaje de pase y su club

players_score%>%
  select(PS,club,player)%>%
  group_by(player)%>%
  arrange(desc(PS))

### mas de MotM  e indice

players_score%>%
  select(MotM,Goals,Mins, player)%>%
  mutate(Goal_Rate=Goals/Mins)%>%
  group_by(player)%>%
  arrange(desc(MotM))

### mas joven con goles anotados

players_score%>%
  filter(Goals>0)%>%
  select(Goals,age,player)%>%
  group_by(player)%>%
  arrange((age))

#### Que entra de cambio mas efectivo al momento de anotar

players_score%>%
  filter(Goals>0)%>%
  select(Goals, mins,player)%>%
  group_by(player)%>%
  arrange((age))

## Jugador mas sucio

players_score%>%
  filter(Red>0)%>%
  filter(Yel>0)%>%
  select(Yel,Red,player)%>%
  mutate(Sucio=Yel+Red)%>%  
  distinct(player,Sucio)%>%
  arrange(desc(Sucio))
  



