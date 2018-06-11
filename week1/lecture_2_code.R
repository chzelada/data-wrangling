##semana 2

df <- read.table("http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat", 
                 header = FALSE)


data<-read.table(file="http://www.sthda.com/upload/decathlon.txt") 
head(data)
data<-read.table(file="http://www.sthda.com/upload/decathlon.txt",header = T) 
head(data)
data<-read.table(file="http://www.sthda.com/upload/decathlon.txt",header = T, row.names = 1) 
head(data)

data["CLAY",]

data<-read.table(file="http://www.sthda.com/upload/decathlon.txt",header = T, row.names = 1,sep="\t") 


con<-url('http://www.sthda.com/upload/decathlon.rdata') # Create connexion
load(con) #Load the data
close(con) #close connexion
print(d) # Print the data


data


data<-read.table(file="http://www.sthda.com/upload/decathlon.txt") 
head(data)
data<-read.table(file="http://www.sthda.com/upload/decathlon.txt",header = T) 
head(data)
data<-read.table(file="http://www.sthda.com/upload/decathlon.txt",header = T, row.names = 1) 
head(data)
data<-read.table(file="http://www.sthda.com/upload/decathlon.txt",header = T, row.names = 1,sep="\t") 


con<-url('http://www.sthda.com/upload/decathlon.rdata') # Create connexion
load(con) #Load the data
close(con) #close connexion
print(d) # Print the data

data["CLAY",]