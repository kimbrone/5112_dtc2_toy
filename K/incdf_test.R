library(tidyverse)
library(haven)
library(readr)
library(plyr)
library(regressoR)

getwd()

roster <- read_dta("Data/glss4_new/data/sec8hid.dta")%>%
  select("hhid", "nh", "clust", "district", "region")

incfiles = "incsets"
incfiles = list.files(
  path = "Data/incsets", pattern = "*.dta", full.names = TRUE
  )
income <- map_dfr(incfiles, read_dta)

total_inc <- sum(income$cropsv1 +
                 income$cropsv2 +
                 income$rootsv +
                 income$othaginc +
                 income$inctrcrp, rm.na = FALSE)
view(total_inc)

livestock <- read_dta("Data/incsets/sec8a2.dta") %>%
  select("clust", "nh", "s8aq31", "s8aq26")

income <- map_dfr(incfiles, read_dta) %>%
  merge(livestock) %>%
  left_join(roster) %>%
  new_col(, name = "inctotal", colSums(
    c("cropsv1", "cropsv2", "rootsv", "s8aq31", "s8aq26", "othaginc",
      "inctrcrp"), na.rm = TRUE))

ggplot(income, mapping = aes())+
  geom_point(region, district)
