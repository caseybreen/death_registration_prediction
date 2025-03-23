## custom color schemes
cudb <- c("#49b7fc", "#ff7b00", "#17d898", "#ff0083", "#0015ff", "#e5d200", "#999999")
cud <- c("#D55E00", "#56B4E9", "#009E73", "#CC79A7", "#0072B2", "#E69F00", "#F0E442", "#999999")


## library packages 
library(tidyverse)
library(haven)
library(cowplot)
library(here)
library(srvyr)
library(tidymodels)
library(vip)
library(ranger)
library(ggsci)
library(sl3)
library(tictoc)
library(yardstick)
library(hstats)
library(kernelshap)
library(shapviz)
library(patchwork)



# Define vector of variables 
vars <- c(
  "female", "death_age",  "rural", "external_death", "state", 
  "working_members", "hh_size", "highest_education", "disabled_member",  
  "female_head", "children_u5", "caste_religion", "wealth_quintile", 
  "own_land", "own_house", "health_insurance", "treatment_usual", 
  "native_language", "internet", "altitude_quintile", "car", 
  "cycle",  "road_length_km_quantile", "facility_distance_quantile")


# vars <- c(
#   "female", "death_age",  "rural", "state", "external_death", 
#   "working_members", "relationship_structure", "hh_size", 
#   "highest_education", "disabled_member",  
#   "female_head", "children_u5", "caste_religion", "wealth_quintile", 
#   "own_land", "own_house", "bank_account", "health_insurance", 
#   "treatment_usual", "translator", "native_language", "internet", "altitude_quintile", "car", 
#   "cycle",  "road_length_km", "facility_distance")


## clean variable names 
clean_varnames <- function(data, colname) {
  data %>% 
    mutate(var_clean = case_when(
      {{colname}} == "state"                    ~ "State",
      {{colname}} == "region"                   ~ "Region",
      {{colname}} == "native_language"          ~ "Native Language",
      {{colname}} == "wealth_quintile"          ~ "Wealth Quintile",
      {{colname}} == "altitude_quintile"        ~ "Altitude Quintile",
      {{colname}} == "death_age"                ~ "Age at Death",
      {{colname}} == "highest_education"        ~ "Highest Education",
      {{colname}} == "road_length_km_quantile"    ~ "Road Length (km)",
      {{colname}} == "rural"                    ~ "Rural Area",
      {{colname}} == "facility_distance_quantile" ~ "Facility Distance",
      {{colname}} == "internet"                 ~ "Internet Access",
      {{colname}} == "female"                   ~ "Female",
      {{colname}} == "female_head"              ~ "Female Household Head",
      {{colname}} == "health_insurance"         ~ "Health Insurance",
      {{colname}} == "cycle"                    ~ "Bicycle Ownership",
      {{colname}} == "own_land"                 ~ "Owns Land",
      {{colname}} == "hh_size"                  ~ "Household Size",
      {{colname}} == "own_house"                ~ "Own House",
      {{colname}} == "children_u5"              ~ "Children Under 5",
      {{colname}} == "car"                      ~ "Car",
      {{colname}} == "working_members"          ~ "Working Members",
      {{colname}} == "road_length_km"          ~ "Road Length",
      {{colname}} == "disabled_member"          ~ "Disabled Member",
      {{colname}} == "caste_religion"          ~ "Caste Religion",
      {{colname}} == "external_death"           ~ "External Cause of Death",
      TRUE ~ as.character({{colname}})
    ))
}

## source .Rmd files 
source_rmd = function(file, ...) {
  tmp_file = tempfile(fileext=".R")
  on.exit(unlink(tmp_file), add = TRUE)
  knitr::purl(file, output=tmp_file, quiet = T)
  source(file = tmp_file, ...)
}








