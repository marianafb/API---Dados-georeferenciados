
library(httr)
library(rjson)

token <- "seu token"
cep_busca <- "cep desejado"
query <- paste("http://www.cepaberto.com/api/v3/cep?cep=",cep_busca,sep="")

busca <- GET(url=query,add_headers('Authorization' = sprintf("Token %s", token)))

if(is.null(busca$headers$status) == FALSE){
  
  dados<-fromJSON(content(busca,as="text"))
  
  base<-data.frame(cep = dados$cep, long = dados$longitude, lat = dados$latitude,
                   end = dados$logradouro, bairro = dados$bairro)
}

