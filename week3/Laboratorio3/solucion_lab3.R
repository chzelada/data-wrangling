##Solucion Lab3
require(dplyr)
require(readxl)
require(tidyverse)
require(leaflet)
require(plotly)

setwd("~/GitHub/data-wrangling/data/01")


inv <- read.csv("tabla_completa.csv")

#Consideraciones
dias_mes = 26
dias_anio = 286
crecimiento = 0.05

#Estado actual de la empresa
#Si esta en blanco, es despacho
summary(inv)
inv$Tipo <- ifelse(str_detect(inv$CLIENTE, "Faltante")==TRUE,
                   "Faltante",
                   ifelse(str_detect(inv$CLIENTE,"DEVOLUCION")==TRUE,
                          "Devolucion",
                          "Despacho"))
inv %>%
  dplyr::group_by(Tipo) %>%
  dplyr::summarise(Cantidad=sum(CANTIDAD),
                   Total=sum(Q),
                   Pilotos=length(unique(PILOTO)),
                   Viajes=n()) %>%
  dplyr::mutate(PorcentajeQ = Total/sum(Total),
                mensualQ = Total/11)

#promedio de viajes para devolucion, faltante y despacho
inv %>% 
  dplyr::group_by(Tipo) %>%
  dplyr::summarise(Viajes=n()/11)

actual <- inv %>%
  dplyr::group_by(MES,Tipo) %>%
  dplyr::summarise(Viajes=n())

plot_ly(
  data=actual,
  x=~MES,
  y=~Viajes,
  color=~Tipo,
  type="bar"
) %>%
  layout(barmode="stack")

#Pregunta 1
inv %>%
  dplyr::group_by(MES, PILOTO) %>%
  dplyr::summarise(OCUPACION_PILOTOS = n()/dias_mes)

inv %>% 
  dplyr::group_by(MES) %>%
  dplyr::summarise(viajes = n(),
                   viajes_dia = viajes/dias_mes,
                   pilotos = length(unique(PILOTO)))


#Pregunta 2
#Codigo de viaje unico?
unique(inv$COD_VIAJE) %>% length()
inv %>% nrow()

inv %>% 
  dplyr::group_by(UNIDAD) %>% 
  dplyr::summarise(Freq=n()) %>% 
  dplyr::mutate(Porcentaje = Freq/sum(Freq))

inv %>% 
  dplyr::group_by(MES, UNIDAD) %>% 
  dplyr::summarise(OCUPACION = n()/dias_mes)

inv %>% 
  dplyr::group_by(UNIDAD) %>%
  dplyr::summarise(OCUPACION = quantile(n()/dias_anio, 0.75)) %>%
  dplyr::mutate(OCUPACION_NUEVA = OCUPACION*(1+crecimiento),
                VEHICULOS_NUEVOS = ceiling(OCUPACION_NUEVA)+1)
                
inv %>% 
  dplyr::group_by(MES, UNIDAD) %>%
  dplyr::summarise(OCUPACION = quantile(n()/dias_mes, 0.75)) %>%
  dplyr::mutate(OCUPACION_NUEVA = OCUPACION*(1+crecimiento),
                VEHICULOS_NUEVOS = ceiling(OCUPACION_NUEVA)+1)

#Pregunta 3 y 4
inv %>% 
  dplyr::group_by(MES,CLIENTE) %>% 
  dplyr::summarise(sum(Q)/sum(CANTIDAD)) %>% 
  dplyr::arrange(CLIENTE) %>% View()

##Pregunta 5
inv %>%
  dplyr::mutate(COSTOxUNIDAD = ifelse())
  dplyr::group_by(UNIDAD) %>%
  dplyr::summarise(sum(Q),
                   sum(CANTIDAD))

#tarifa es igual por diferentes destinos entonces puedo diferenciarla depende de donde este
inv %>% group_by(UBICACION) %>% summarise(sum(Q)/sum(CANTIDAD))

require(plotly)
inv2 <- inv %>% group_by(MES) %>% summarise(CANTIDAD=sum(CANTIDAD))
prom <- inv2 %>% summarise(Promedio=mean(CANTIDAD),
                           percentil75=quantile(CANTIDAD, 0.75))
plot_ly(
  data=inv2, 
  x=~inv2$MES, 
  y=~inv2$CANTIDAD, 
  type="scatter", 
  mode="line+markers", 
  name="CANTIDAD"
) %>%
  add_lines(data=prom, 
            y=~Promedio, 
            name="Promedio"
  ) %>%
  add_lines(data=prom, 
            y=~percentil75, 
            name="75p"
  )


#tabla para meses
inv3 <- inv %>%
  dplyr::group_by(MES, UNIDAD) %>%
  dplyr::summarise(CANTIDAD=sum(CANTIDAD),
                   TOTAL=sum(Q))
#total por tipo de camion por mes
plot_ly(
  data=inv3,
  x=~MES,
  y=~TOTAL,
  color=~UNIDAD,
  type="scatter",
  mode="line+markers"
)
#cantidad por tipo de camion por mes
plot_ly(
  data=inv3,
  x=~MES,
  y=~CANTIDAD,
  color=~UNIDAD,
  type="scatter",
  mode="line+markers"
)

#La tendencia crece para camiones grandes y va bajando para pequenios y paneles entonces se pueden crear campanias para los que
#bajan y seguir bien con los grandes o al criterio

#cantidad de viajes por piloto por origen
inv4 <- inv %>% group_by(PILOTO) %>% summarise(Freq=n())
inv5 <- inv %>% group_by(PILOTO) %>% summarise(CANTIDAD=sum(CANTIDAD), TOTAL=sum(Q))

ay <- list(
  tickfont = list(color = "orange"),
  overlaying = "y",
  side = "right",
  title = "Total"
)

plot_ly(
  data=inv4,
  x=~PILOTO,
  y=~Freq,
  type="bar",
  name="Viajes"
) %>%
  add_trace(
    data=inv5,
    x=~inv5$PILOTO,
    y=~inv5$TOTAL,
    type="scatter",
    mode="line+markers",
    name="TOTAL",
    yaxis="y2"
  ) %>%
  layout(yaxis = list(title = 'Count'), 
         yaxis2 = ay)

#Indice de piloto
inv %>% 
  dplyr::group_by(PILOTO) %>%
  dplyr::summarise(Indice = n()/sum(Q))



###Entendiendo la ubicacion
para_grafica <- inv %>% 
  dplyr::group_by(MES, UBICACION) %>%
  dplyr::summarise(CANTIDAD=sum(CANTIDAD, na.rm=TRUE),
                   Total=sum(Q, na.rm=TRUE))
plot_ly(
  data=para_grafica,
  x=~MES,
  y=~Total,
  color=~UBICACION,
  colors=c("navy", "skyblue"),
  type="bar"
) %>%
  layout(yaxis = list(title = 'Total'), 
         barmode="stack")

para_grafica2 <- inv %>% 
  dplyr::group_by(MES, UBICACION) %>%
  dplyr::summarise(Total=sum(Q, na.rm=TRUE)) %>%
  dplyr::mutate(Porcentaje=Total/sum(Total))
plot_ly(
  data=para_grafica2,
  x=~MES,
  y=~Porcentaje,
  color=~UBICACION,
  colors=c("navy", "skyblue"),
  type="bar"
) %>%
  layout(yaxis = list(title = 'Total'), 
         barmode="stack")

######PARA MAPAS
inv_nuevo <- inv
inv_nuevo$Departamento <- ifelse(inv_nuevo$UBICACION==76001,"Guatemala","Escuintla")
data <- inv_nuevo %>%
  dplyr::group_by(Departamento) %>%
  dplyr::summarise(Total=sum(Q))

#tabla de departamentos
norm <- read_excel("C:/Users/JR29/Dropbox (Improgress)/PUM PUR Public/R/Modelo_costos/PUM PUR Deptos.xlsx")
names(norm) <- c("Departamento", "DeptoN")
data <- merge(data,norm,by="Departamento", all.x=TRUE)
data <- data %>% select(Departamento=DeptoN,Total)

#Mapa por departamento
GT <- readr::read_rds("C:/Users/JR29/Dropbox (Improgress)/EEG LOG Public/Mapas/ANC GOB/GTM_adm1.rds")
GT$NAME_1[13]<-"Quetzaltenango"
nombres <- GT$NAME_1 %>% as.data.frame()
names(nombres)<-"Departamento"
data <- merge(nombres, data, by="Departamento", all.x=TRUE)

variable <- "Total"
GT$Casos <- data[,variable]
b <- quantile(data[,variable], c(0,.2, .4, .6, .8, 1), na.rm = T)
qpal <- colorBin(palette = "Reds", domain = GT$Casos, pretty = F, reverse = F, bins = b,na.color = "#a4a9a6")

labels <- sprintf(
  "<strong>%s</strong><br/>%g </sup>",
  paste(GT$NAME_1,GT$NAME_2, sep = "-"), GT$Casos
) %>% lapply(htmltools::HTML)

leaflet(GT) %>% addPolygons(
  fillColor = ~qpal(Casos),
  weight = 2,
  opacity = 1,
  color = "white",
  dashArray = "3",
  fillOpacity = 0.7,
  highlight = highlightOptions(
    weight = 5,
    color = "#666",
    dashArray = "",
    fillOpacity = 0.7,
    bringToFront = TRUE),
  label = labels,
  labelOptions = labelOptions(
    style = list("font-weight" = "normal", padding = "3px 8px"),
    textsize = "15px",
    direction = "auto"))%>%
  leaflet::addLegend(pal = qpal, values = ~Casos, opacity = 1, title = "Mapa de facturacion 2017")


