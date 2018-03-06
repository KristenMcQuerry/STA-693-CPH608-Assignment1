## install packages
install.packages("gapminder")
install.packages("tidyverse")
install.packages("nycflights13")

## load libraries
library(gapminder)
library(dplyr)
library(tidyverse)
library(nycflights13)

## Look at data
flights  

#***************************** Find out flights ****************************#
## a. Had an arrival delay of two or more hours
flights %>%
  filter(arr_delay >= 120)

## b. Flew to Houston (IAH or HOU)
flights %>%
  filter(dest == 'HOU' | dest == 'IAH')

## c. Were operated by United, American, or Delta
flights %>%
  filter(carrier == 'AA' | carrier == 'UA' | carrier == 'DL')

## d. Departed in summer (July, August, and September)
flights %>%
  filter(month == 6 | month == 7 | month == 8)

## e. Arrived more than two hours late, but didn't leave late
flights %>%
  filter(arr_delay >= 120 & dep_delay <= 0)

## f. Were delayed by at least an hour, but made up over 30 minutes in flight
flights %>%
  filter(dep_delay >= 60) %>%
  filter(arr_delay <= dep_delay-30)

## g. Departed between midnight and 6 a.m. (inclusive)
flights %>%
  filter(dep_time >= 0 & dep_time <= 630)

## h. Sort to find the most delayed flights. Find the flights that left earliest.
flights %>%
  arrange(dep_delay)

flights %>%
  arrange(desc(dep_delay))

## i. Sort to find the fastest flights
flights %>%
  mutate(speed = distance / air_time) %>%
  arrange(speed)

## j. Which flights traveled the longest? Which traveled the shortest?
flights %>%
  arrange(distance)

flights %>%
  arrange(desc(distance))
