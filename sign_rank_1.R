### preamble
library(tidyverse)

### read in the data
trefler <- read_csv("trefler.csv")

### initial setup
# number of countries and factors
no_countries <- trefler %>%
    select(country) %>%
    n_distinct()

no_factors <- trefler %>%
    select(factor) %>%
    n_distinct()

# calculating global (world) output per factor, trade balance per factor, and endowments
gdp_w <- trefler %>% 
    select(gdp) %>% 
    sum() / no_factors

tradebal_w <- trefler %>% 
    select(trade_balance) %>% 
    sum() / no_factors

V_fw <- trefler %>%
    select(factor, endowment) %>% 
    group_by(factor) %>% 
    summarise(endowment = sum(endowment))

# calculating country shares of consumption
trefler <- trefler %>% 
    mutate(share = (gdp - trade_balance) / (gdp_w - tradebal_w))


### conduct the sign tests
# final correlation should be 0.28


### test for missing trade
# missing trade should be 0.032


### conduct the rank tests