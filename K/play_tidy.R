library(purrr)
library(haven)
library(tidyverse)

#Creating base data frames:

aggs <- list.files(path="Data/glss4_new/aggregates/", pattern = "", full.names = TRUE)
aggregates <- map_df(aggs, read_dta, .id = "id") 

prices <- read_dta("Data/glss4_new/prices/g4price.dta")

community <- list.files("Data/glss4_new/community", pattern = "", full.names = TRUE)
community <- map_df(community, read_dta, .id = "id")

expenditures <- list

inc_vals <- list.files(path="Data/glss4_new/aggregates", pattern = "inc", full.names = TRUE)
income <- map_df(inc_vals, read_dta, .id = "id")

income_crops <- list.files(path="Data/glss4_new/aggregates", pattern = "inc1", full.names = TRUE)
income_crops <- map_df(income_crops, read_dta, .id = "id")

#Explicitly asked to consider impact of education:

education <- read_dta("Data/glss4_new/data/sec2a.dta")
plot_details <- read_dta("Data/glss4_new/data/sec8b.dta")

#Need to:  

1. Decide how to factor this in - highest level of ed in home, or perhaps
  average ed yrs? (Are kids included, how do we ascertain age?)
2. Figure out profit - combined all expenditures and subtract from income - 
  a) What income are we going to consider?
  Links discussing 
  b) What expenditures will we consider?


#Maybe worth considering?

savings <- read_dta("Data/glss4_new/data/sec12c.dta")

