library(tidyr)

air_data<-read.csv(file.choose(), sep=";")
head(air_data, 25)
str(air_data)

#finding missing values and impute

col_miss<-mapply(anyNA, air_data)
col_miss

attach(air_data)

#imputing an taking the mean of the respective column

for (i in 1:nrow(air_data))
{
  
  if(is.na(air_data[i,"PT08.S1.CO."])){
    air_data[i,"PT08.S1.CO."]<- 
      mean(air_data[which(air_data[,"Date"]
                            ==air_data[i,"Date"]),"PT08.S1.CO."],
           na.rm = TRUE)
  }
}

normalize<- function(x){
  return((x-min(x))/(max(x)-min(x)))
}

airquality[,1:4]<- air_data(air_data[,1:4])
