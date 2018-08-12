
#pacotes
library(httr)
library(rjson)

token     <- "seu token"    #chave de identificação fornecida pelo site
cep_busca <- "cep desejado" #cep que você deseja obter a latitude e longitude
query     <- paste("http://www.cepaberto.com/api/v3/cep?cep=",cep_busca,sep="") #url 

busca <- GET(url=query,add_headers('Authorization' = sprintf("Token %s", token))) #requisição API

#retirando as informações do site
if(is.null(busca$headers$status) == FALSE){ 
  
  dados<-fromJSON(content(busca,as="text")) 
  
  base<-data.frame(cep = dados$cep, long = dados$longitude, lat = dados$latitude,
                   end = dados$logradouro, bairro = dados$bairro)
}

