library(tidyverse)
library(readr)
files <- list.files(path="football-world-cup-2018-dataset/")

## https://www.kaggle.com/sawya34/football-world-cup-2018-dataset/home
## https://www.whoscored.com/Statistics

fixture<-read_csv(file ="football-world-cup-2018-dataset/Fixture.csv" )
players<-read_csv(file ="football-world-cup-2018-dataset/Players.csv")
players_score<-read_csv(file ="football-world-cup-2018-dataset/Players_Score.csv")
players_stats<-read_csv(file ="football-world-cup-2018-dataset/Players_Stats.csv")
teams<-read_csv(file ="football-world-cup-2018-dataset/Teams.csv")

####players_score necesita que al importar se cambien todas las variables
head(players_score)
players_score$Apps<-str_replace_all(players_score$Apps, "\\([^)]*\\)","")
players_score$cambio<-str_extract_all(players_score$Apps, "\\([^)]*\\)","")
players_score$cambio<-str_extract_all(players_score$cambio,"[0-9]+")
###reemplazar guiones con 0
numbers<-c("age","Apps","cambio","Goals","Assists","Yel","Red","SpG","PS","AerialsWon","MotM","Rating")
players_score[numbers] %>% str()
numbers<-c("age","Apps","cambio","Goals","Assists","Yel","Red","SpG","PS","AerialsWon","MotM","Rating")
###

###reemplazar guiones con 0
players_score[numbers] %>% str()

players_score[numbers] <- lapply(players_score[numbers],as.numeric)
head(players_score)



##puntos extra al que encuentre una manera mas eficiente de hacer esto.
players_score[numbers]<-players_score[numbers] %>% 
  replace_na(list(age=0,Goals=0,Assists=0,Yel=0,Red=0,SpG=0,PS=0,AerialsWon=0,MotM=0,Rating=0, cambio=0))



#####

         
head(players_score)

######filter()
players_score %>% 
  #filter(club == "Real Madrid") %>%
  arrange(desc(Goals))

players_score %>%
  mutate(Goal_Rate = Mins/Goals) %>%
  arrange(Goal_Rate)


players_score %>%
  filter(Goals > 0) %>%
  mutate(Goal_Rate = Mins/Goals) %>%
  arrange(Goal_Rate) %>% 
  distinct()

players_score <-players_score %>%
  filter(Goals > 0) %>%
  mutate(Goal_Rate = Mins/Goals) %>%
  arrange(Goal_Rate) %>% 
  distinct()

###arrange() por default es ascending.
##arrange(desc(variable))
###mutate()
## distinct()


#####ggplot
## en aes color, size,
## scale_x_log10()
#facet_wrap()
## expand_limits
##barplot, x categorica, y numerica. geom_col

by_continent <-gapminder %>%
  filter(year==1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))


ggplot(by_continent, aes(,x= continent, y= medianGdpPercap)) +
  geom_col() 



by_year_continent <-gapminder %>% 
  group_by(year,continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))


ggplot(by_year_continent, aes(color=continent,x= year, y= medianGdpPercap)) +
  geom_line() +
  expand_limits(y=0)


players_score %>%
  arrange(desc(MotM))


library(ggplot2)
ggplot(players_score, aes(x=age)) + geom_histogram(bins = 25)

ggplot(players_score, aes(x=Goal_Rate,y=MotM)) + geom_jitter()

