## preamble
library(tidyverse)

## read in the data
HEADERS <- c("country", "factor", "factor_content", "endowment", "gdp", "trade_balance", "ypc", "pop")
# note `ypc` refers to `gdp per capita`
trefler_data <- read_csv("hov_pub.csv", col_names = HEADERS)

## creating a country index
# selecting max ypc (USA) and a ratio to the US for all countries
max_ypc <- trefler_data %>%
    select(ypc) %>%
    max()

trefler_data <- trefler_data %>%
    mutate(ypc_ratio = ypc / max_ypc) %>%
    mutate(ypc_ratio = ifelse(country == "Italy", ypc_ratio + 0.0001, ypc_ratio))
# includes Italy specific adjustment from original code

# sorting and indexing
#trefler_data <- trefler_data %>%
#    group_by(ypc_ratio) %>%
#    mutate(country_id = row_number())

## creating a factor index


## adding deltas. See column (ii) of Table 2 in Trefler (1995) or column (6) of Table 2.5 in Feenstra (2016)




## save output

