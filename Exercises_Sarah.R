#MLU child directed speech 

getwd()
source("CRANtoR_function.R")
library(plyr)
library(dplyr)

?list.files
files = list.files(path = "data", full.names = T)
View(files)
sarah_data <- map_df(files,function(x) read.CLAN.file(x))
View(sarah_data)
data = select(sarah_data, "Speaker", "Gloss", "Date")
write.csv(data, file = "sarah_data_imported.csv")


#Part 2: sorting the data 
#Loading the data and setting the classes
sarah_data <- read.csv("sarah_data_imported.csv", header = TRUE)
class(sarah_data$Speaker)
class(sarah_data$Gloss)
sarah_data$Gloss <- as.character(sarah_data$Gloss)
class(sarah_data$Date)
sarah_data$Date <- anytime::anydate(sarah_data$Date)

#Selecting relevant data 
sarah_data <- filter(sarah_data, Speaker == "MOT" | Speaker == "CHI")
