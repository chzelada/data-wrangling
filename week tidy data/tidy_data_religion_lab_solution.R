library(tidyverse)
library(reshape2)


load("dirty_religion.Rda")
load("wide_religion.Rda")


####melting wide_religion
tidy_religion <- melt(wide_religion, id = c("religion"), na.rm = TRUE)
names(tidy_religion)[2] <-"income"
names(tidy_religion)[3] <-"counts"
head(tidy_religion)
##gathering wide_religion
tidy_religion_gather <-gather(wide_religion, key="income",value="counts",-religion)
head(tidy_religion_gather)
###dirty religion
head(religion)

### changing ranges in income variable
religion$income <- c("Less than $10,000" = "<$10k", 
                     "10 to under $20,000" = "$10-20k", 
                     "20 to under $30,000" = "$20-30k", 
                     "30 to under $40,000" = "$30-40k", 
                     "40 to under $50,000" = "$40-50k", 
                     "50 to under $75,000" = "$50-75k",
                     "75 to under $100,000" = "$75-100k", 
                     "100 to under $150,000" = "$100-150k", 
                     "$150,000 or more" = ">150k", 
                     "Don't know/Refused (VOL)" = "Don't know/refused")[religion$income]

###making religion income a factor
religion$income <- as.factor(religion$income)
counts <- count(religion, c("reltrad", "income"))
#### counting reltrad and income

counts<-count(religion, c("reltrad","income"))
names(counts)[1] <- "religion"

##They become the same dataset.
head(counts)
head(tidy_religion)
