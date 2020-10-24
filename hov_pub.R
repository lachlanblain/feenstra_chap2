### preamble
library(tidyverse)

### read in the data
HEADERS <- c("country", "factor", "factor_content", "endowment",
             "gdp", "trade_balance", "ypc", "pop") # note `ypc` refers to `gdp per capita`
trefler <- read_csv("hov_pub.csv", col_names = HEADERS)

### creating a country index
## selecting max ypc (USA) and creating a ratio relative to this for all countries
max_ypc <- trefler %>%
    select(ypc) %>%
    max()

trefler <- trefler %>%
    mutate(ypc_ratio = ypc / max_ypc) %>%
    mutate(ypc_ratio = ifelse(country == "Italy",
                              ypc_ratio + 0.0001,
                              ypc_ratio)) # Italy specific adjustment from original code

## sorting and indexing
trefler <- trefler %>%
    arrange(ypc_ratio) %>%
    group_by(ypc_ratio) %>% 
    mutate(country_id = cur_group_id())

### creating a factor index
trefler <- trefler %>% 
    arrange(factor) %>% 
    group_by(factor) %>% 
    mutate(factor_id = cur_group_id())

### adding deltas. See column (6) of Table 2.5 in Feenstra (2016) or column (ii) of Table
# 2 in Trefler (1995, p. 1037)
deltas <- cbind(c("Bangladesh", "Pakistan", "Indonesia", "Sri Lanka", "Thailand","Colombia",
                  "Panama", "Yugoslavia", "Portugal", "Uruguay", "Greece", "Ireland",
                  "Spain", "Israel", "Hong Kong", "New Zealand", "Austria", "Singapore",
                  "Italy", "UK", "Japan", "Belgium", "Trinidad", "Netherlands", "Finland",
                  "Denmark", "West Germany", "France", "Sweden", "Norway", "Switzerland",
                  "Canada", "USA"),
                c(0.03, 0.09, 0.10, 0.09, 0.17, 0.16, 0.28, 0.29, 0.14, 0.11, 0.45, 0.55,
                  0.42, 0.49, 0.40, 0.38, 0.60, 0.48, 0.60, 0.58, 0.70, 0.65, 0.47, 0.72,
                  0.65, 0.73, 0.78, 0.74, 0.57, 0.69, 0.79, 0.55, 1.00))
colnames(deltas) <- c("country", "delta")
deltas <- as_tibble(deltas)

trefler <- inner_join(trefler, deltas, by = "country")

### save output
write_csv(trefler, "trefler.csv")