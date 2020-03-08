# library(readr) office = read_csv('~/Documents/office.csv') use_data(office, overwrite = TRUE)

# class(top_speakers) unique(office$speaker) library(tidyverse) top_speakers <- office %>% select(speaker) %>%
# mutate(speaker = factor(speaker)) %>% group_by(speaker) %>% count() %>% arrange(desc(n)) %>% head(40) %>% select(speaker)
# %>% ungroup() %>% mutate(speaker = as.character(speaker)) %>% pull() use_data(top_speakers, overwrite = TRUE)

source("R/get_quote.R")

quote_about("Pam")
