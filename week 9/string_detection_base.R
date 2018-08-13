
##########################
library(tidyverse)
library(dplyr)
library(readr)
library(stringr)
library(ggplot2)

ban<-g %>% 
  filter(str_detect(message, "Banrural|BANRURAL"))
View(ban)

ban <- as.data.frame(ban)

longtailban <- ban %>% 
  select(message,n) %>% 
  group_by(message) %>% 
  summarise(sms=sum(n)) %>% 
  mutate(pct=sms/sum(sms)) %>% 
  arrange(desc(sms)) %>% 
  distinct()
longtailban$pct %>%sum()

ggplot(data = ban, aes(x=reorder(message,-n),y=n,group=1)) + geom_point() + 
  geom_line() + 
  ylim(0, 1000000) +
  #geom_vline(xintercept = 5) +
  ggtitle("Ban Longtail") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 
longtailban %>% View()

write.csv(longtailban, file = "longtail_ban.csv")

