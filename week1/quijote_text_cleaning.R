quijote_lines
library(tidytext)
library(tidyverse)


##Que pasa si quisieramos analizar el texto de algun documento completo?
##Esto es común para análisis de plagio, para análisis de sentimiento o para clasificación de comentarios.

##primero volveremos un dataframe al texto del quijote. Utilizamos la funcion del tidyverse para esto.

quijote_frame<-data_frame(txt=quijote_lines)

##esto nos devuelve un data frame donde cada linea del texto es una observacion.
quijote_frame

##Okay, ahora extraigamos cada una de las palabras para tener un dataframe con las palabras unicamente.
#Aca hacerle pregunta a la funcion unnest_tokens para ver como funciona y que es lo que hace.
quijote_words <- unnest_tokens(quijote_frame,output = word,input = txt, token = "words" )
quijote_sentences <- unnest_tokens(quijote_frame,output = word,input = txt, token = "sentences" )
quijote_count<-count(quijote_words,word, sort = TRUE)

#Acá tenemos la cuenta de cada una de las distintas palabras del texto. No nos dice mucho. a que se debe esto?
## the main programming language, is not Java or Python but English
quijote_count

##### utilizaremos el paquete de quanteda para limpiar el dataframe con stop words en español.
install.packages("quanteda")

spanish_stopwords<-data_frame(word=quanteda::stopwords(language = "es"))
spanish_stopwords

##creamos un dataframe nuevo con las palabras limpias
quijote_words_clean <- quijote_frame %>% 
  unnest_tokens(output =word, input = txt, token="words") %>%
  anti_join(spanish_stopwords) %>%
  count(word, sort=TRUE)

quijote_words_clean
