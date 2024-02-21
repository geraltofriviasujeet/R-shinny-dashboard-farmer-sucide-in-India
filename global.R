# Packages
#install.packages(c("shiny", "shinydashboard", "dplyr", "DT", "readxl", "ggplot2", "plotly", "ggtext", "ggcorrplot", "reshape2"))
#library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(readxl)
library(ggplot2)
library(plotly)
library(ggtext)
library(ggcorrplot)
library(reshape2)

#Global 
data = read_excel("RS_Session_259_AU_994_A_to_G_i.xlsx")

data = data[-37, ]
data <- mutate_all(data, funs(ifelse(. == "NA", NA, .)))
#Converting required columns to numeric
numeric_columns = c("Farmers/Cultivators - 2017","Farmers/Cultivators - 2018","Farmers/Cultivators - 2019","Farmers/Cultivators - 2020","Farmers/Cultivators - 2021")  
data = data %>%
  mutate_at(vars(numeric_columns), as.numeric)


#structure
data %>% 
  str()

#Summary
data %>% 
  summary()



#Choices for input 
choices1 = data %>% 
  select(-'State/UT') %>% 
  names()


#Assigning statenames
State = data[["State/UT"]]

