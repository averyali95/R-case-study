#Case study
#business taskL: What are some trends in smart device usage from non-bellabeat products. How could these trends 
#apply to bellabeat customers. How could these trends influence marketing?

install.packages("tidyverse")
install.packages("ggplot2") #plot data

#CLEAN DATA packages
install.packages("dplyr")
install.packages("skimr") #summarize data, skim quickly
install.packages("here") #finding 
install.packages("janitor") #clean data 

library(tidyverse)
library(janitor) #clean data 
library(ggplot2) #plot data
library(skimr) #summarize data, skim quickly
library(here) #finding 

daily_activity <- read.csv("dailyActivity_merged.csv")

#summarize and view data
head(daily_activity)
colnames(daily_activity)
skim_without_charts(daily_activity) 
glimpse(daily_activity)
summary(daily_activity)

cleaned_daily_activity <- clean_names(daily_activity) # clean column names, column names are consistent and unique 

#look at distinct users in the cleaned daily activity table
n_distinct(cleaned_daily_activity$id) # there are 33 unique individual id numbers

#lets look at some quick statistics based on some important data
cleaned_daily_activity %>% select(total_steps,total_distance,sedentary_minutes,calories) %>%  summary()

#lets find out how many distinct users had days of no use
days_with_no_activity <- cleaned_daily_activity %>% filter(sedentary_minutes == 1440) %>% select(id,activity_date)
n_distinct(days_with_no_activity$id) #17 users had days with no activity
nrow(days_with_no_activity) #79/940 total combined days with no activity 

################################ SLEEP DATA ########################################################
sleep_data <- read.csv("sleepDay_merged.csv")

head(sleep_data) #we notice that the SleepDay data is mm/dd/yyyy xx.xx.xx AMPM format.

