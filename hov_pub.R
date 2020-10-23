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
    mutate(ypc_ratio = ypc /max_ypc)

# adjustment for Italy - from original code -- issue is this drops all the other countries!!
trefler_data <- trefler_data %>%
    filter(country == "Italy", .preserve = TRUE) %>%
    mutate(ypc_ratio = ypc_ratio + 0.0001)

# sorting and indexing
trefler_data <- trefler_data %>%
    group_by(ypc_ratio) %>%
    mutate(country_id = row_number())

## creating a factor index


## adding deltas. See column (ii) of Table 2 in Trefler (1995) or column (6) of Table 2.5 in Feenstra (2016)




## save output

