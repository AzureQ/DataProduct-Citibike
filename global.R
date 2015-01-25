library(jsonlite)
library(httr)
citibike <- fromJSON("http://citibikenyc.com/stations/json")
executiontime <- citibike$executionTime
stations <- citibike$stationBeanList 
fieldnames <- colnames(stations)
stationNames <- stations$stationName

NearestStations <- function(st,sts){
  lat <- st$latitude
  long <- st$longitude
  sts$distance<-sqrt((sts$latitude-lat)^2+(sts$longitude-long)^2)
  sts <- sts[with(sts,order(distance)),]
  return(sts)
}