library(purrr)
library(haven)

aggs <- list.files(path="Data/glss4_new/aggregates/", pattern = "", full.names = TRUE)
subagg <- list.files(path="Data/glss4_new/aggregates/", pattern = "subagg", full.names = TRUE)
subagg <- list.files(path="Data/glss4_new/aggregates/", pattern = "subagg", full.names = TRUE)
subagg <- list.files(path="Data/glss4_new/aggregates/", pattern = "subagg", full.names = TRUE)
data_aggs <- map_df(aggs, read_dta, .id = "id") 
summary(subagg)
