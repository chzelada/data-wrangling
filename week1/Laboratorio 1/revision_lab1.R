library(dplyr)
setwd("~/GitHub/data-wrangling/week1/Laboratorio 1")

revision <- function(dat){
  result <- dat %>% dplyr::group_by(UNIDAD) %>% dplyr::summarise(`Costo Total` = sum(as.numeric(Q)))
  result$`Costo Total` <- as.integer(result$`Costo Total`)
  result[,2] <- round(result[,2],0)
  ifelse(result[1,2] == 455466 & result[2,2] == 112815 & result[3,2] == 30566,
         return("Status: APPROVED"), 
         return("Status: FAILED"))
}
