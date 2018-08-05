#' @title Lab01: National bottling consultancy
#' @author 20180190 Fernanda González
#' @description Pseudocode:
#' - Import each file as a dataframe
#' - Add date column
#' - Merge in a single dataframe
#' - Export .csv

library(readxl)

WD <- getwd()
files <- list.files(WD, pattern="*.xlsx")

#' Method 1
# df.list <- sapply(files, read_excel)

#' Method 2
for(i in 1:length(files)){
  assign(files[i],read_excel(files[i]))
}

`01-2017.xlsx`=cbind(Fecha="2017-01", `01-2017.xlsx`)
`02-2017.xlsx`=cbind(Fecha="2017-02", `02-2017.xlsx`)
`03-2017.xlsx`=cbind(Fecha="2017-03", `03-2017.xlsx`)
`04-2017.xlsx`=cbind(Fecha="2017-04", `04-2017.xlsx`)
`05-2017.xlsx`=cbind(Fecha="2017-05", `05-2017.xlsx`)
`06-2017.xlsx`=cbind(Fecha="2017-06", `06-2017.xlsx`)
`07-2017.xlsx`=cbind(Fecha="2017-07", `07-2017.xlsx`)
`07-2017.xlsx`<-`07-2017.xlsx`[c(-10)]
`08-2017.xlsx`=cbind(Fecha="2017-08", `08-2017.xlsx`)
`08-2017.xlsx`<-`08-2017.xlsx`[c(-10)]
`09-2017.xlsx`=cbind(Fecha="2017-09", `09-2017.xlsx`)
`09-2017.xlsx`<-`09-2017.xlsx`[c(-10)]
`10-2017.xlsx`=cbind(Fecha="2017-10", `10-2017.xlsx`)
`10-2017.xlsx`<-`10-2017.xlsx`[c(-10)]
`11-2017.xlsx`=cbind(Fecha="2017-11", `11-2017.xlsx`)
`11-2017.xlsx`<-`11-2017.xlsx`[c(-10)]

entregas2017=rbind(`01-2017.xlsx`,`02-2017.xlsx`, `03-2017.xlsx`, `04-2017.xlsx`, `05-2017.xlsx`, `06-2017.xlsx`,`07-2017.xlsx`, `08-2017.xlsx`,`09-2017.xlsx`,`10-2017.xlsx`, `11-2017.xlsx`)
write.csv(entregas2017,"entregas2017.csv")