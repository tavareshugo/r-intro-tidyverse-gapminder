# Fetching all data from
# https://github.com/open-numbers/ddf--gapminder--systema_globalis

library(tidyverse)

#
# Fetch geo data --------------------------------------------------------------
#
# read data from web
geo <- read_csv("https://github.com/open-numbers/ddf--gapminder--systema_globalis/raw/master/ddf--entities--geo--country.csv") %>%
  # retain only UN countries
  filter(un_state) %>%
  # select columns of interest
  select(country,
         name,
         world_region = world_6region,
         economic_organisation = g77_and_oecd_countries,
         income_groups,
         latitude,
         longitude,
         main_religion_2008) %>%
  # change one NA in g77_and_oecd_countries
  replace_na(list(economic_organisation = "others"))


#
# Fetch datapoints --------------------------------------------------------
#
# Population, Health, Economy
pop_datasets <- c("male_population_with_projections",
                  "female_population_with_projections",
                  #"population_total",
                  "income_per_person_gdppercapita_ppp_inflation_adjusted",
                  "life_expectancy_years",
                  "children_per_woman_total_fertility",
                  "newborn_mortality_rate_per_1000",
                  "child_mortality_0_5_year_olds_dying_per_1000_born",
                  "life_expectancy_female",
                  "life_expectancy_male",
                  "females_aged_15plus_employment_rate_percent",
                  "males_aged_15plus_employment_rate_percent",
                  "hdi_human_development_index")

# Energy
energy_datasets <- c("yearly_co2_emissions_1000_tonnes",
                     "coal_consumption_per_cap",
                     "electricity_generation_per_person",
                     "electricity_use_per_person",
                     "hydro_power_generation_per_person",
                     "natural_gas_production_per_person",
                     "nuclear_power_generation_per_person",
                     "energy_production_per_person",
                     "energy_use_per_person",
                     "oil_consumption_per_cap",
                     "oil_production_per_person")

# make function to read and tidy these data
read_gapminder_datapoints <- function(datasets, geo_tbl){

  # read data
  datapoints <- map(datasets, function(i){
    read_csv(paste0("https://github.com/open-numbers/ddf--gapminder--systema_globalis/raw/master/ddf--datapoints--", i, "--by--geo--time.csv"), col_types = cols())
  })

  # join the tables together
  datapoints <- datapoints %>%
    reduce(full_join, by = c("geo", "time")) %>%
    # rename some columns
    rename(country = geo, year = time) %>%
    # retain only data between 1960 and 2010
    filter(year >= 1960 & year <= 2010)

  # join with geographic information table
  datapoints <- inner_join(geo_tbl, datapoints, by = "country")
}

# read population, health, economy data
pop_datapoints <- read_gapminder_datapoints(pop_datasets, geo)

# reorder and rename columns
pop_datapoints <- pop_datapoints %>%
  select(country, name, world_region, economic_organisation, income_groups,
         main_religion = main_religion_2008,
         year,
         population_male = male_population_with_projections,
         population_female = female_population_with_projections,
         income_per_person = income_per_person_gdppercapita_ppp_inflation_adjusted,
         life_expectancy = life_expectancy_years,
         life_expectancy_female, life_expectancy_male,
         children_per_woman = children_per_woman_total_fertility,
         newborn_mortality = newborn_mortality_rate_per_1000,
         child_mortality = child_mortality_0_5_year_olds_dying_per_1000_born,
         employment_percent_female = females_aged_15plus_employment_rate_percent,
         employment_percent_male = males_aged_15plus_employment_rate_percent,
         hdi_human_development_index) %>%
  # remove one country (Liechtenstein) with no data for most variables
  filter(!is.na(income_per_person))

# read environment, energy data
energy_datapoints <- read_gapminder_datapoints(energy_datasets, geo)

# reorder and rename columns
energy_datapoints <- energy_datapoints %>%
  select(country, name, world_region, year,
         yearly_co2_emissions = yearly_co2_emissions_1000_tonnes,
         energy_use_per_person,
         coal_use_per_person = coal_consumption_per_cap,
         oil_use_per_person = oil_consumption_per_cap,
         electricity_use_per_person,
         energy_production_per_person,
         electricity_generation_per_person,
         hydro_power_generation_per_person,
         natural_gas_production_per_person,
         nuclear_power_generation_per_person,
         oil_production_per_person)


#
# write data --------------------------------------------------------------
#
pop_datapoints %>%
  filter(year == 2010) %>%
  write_csv("./_episodes_rmd/data/gapminder2010_socioeconomic.csv")

pop_datapoints %>%
  write_csv("./_episodes_rmd/data/gapminder1960to2010_socioeconomic.csv")

energy_datapoints %>%
  write_csv("./_episodes_rmd/data/gapminder1960to2010_energy.csv")


#
# notes -------------------------------------------------------------------
#
# To search for interesting datasets

# data_index <- read_csv("https://github.com/open-numbers/ddf--gapminder--systema_globalis/raw/master/ddf--concepts.csv") %>%
#   full_join(
#     read_csv("https://github.com/open-numbers/ddf--gapminder--systema_globalis/raw/master/ddf--entities--tag.csv"),
#     by = c("tags" = "tag")
#   )
#
# data_index %>%
#   filter(str_detect(concept, "energy")) %>%
#   select(concept, parent) %>% print(n = Inf)
#
# data_index %>%
#   filter(parent == "energy") %>%
#   pull(concept)
