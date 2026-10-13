packages <- c("here", "janitor", "tidyverse", "sf", "terra", "tmap", "spData", "spDataLarge", "geodata", "kableExtra", "viridisLite")
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}
library(here)
library(janitor)
library(tidyverse)
library(sf)
library(kableExtra)

gdw_df <- read_csv(here("week_0/data", "gdw.csv")) |>
  clean_names() #read in .csv, clean the names of the column

head(gdw_df, n = 10) |> 
  kable()

tail(gdw_df, n = 10) |> 
  kable()

dim(gdw_df)
nrow(gdw_df)
ncol(gdw_df)
names(gdw_df)

countries_df <- gdw_df[,'country']
countries_df

countries_vec <- gdw_df[,'country']
countries_vec

gdw_df |> 
group_by('dam_type') |> 
  summarise(count=n()) |> 
  ungroup()

sub_dam <- gdw_df |> 
  filter(dam_type == 'Dam')

gdw_df <- gdw_df |> 
  arrange(year_dam)


