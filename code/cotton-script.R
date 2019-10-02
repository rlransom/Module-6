########################################################################################
# Summary: Tidying and analyzing cotton production trends in NC
# Date: September 25, 2019
########################################################################################

# Clear workspace & load packages ----
rm(list=ls(all=TRUE))
library(tidyverse)

# 2. Read & inspect the dataset ----
cotton <- read_csv("data/cotton-usda-nass.csv")
str(cotton)
summary(cotton)
colnames(cotton)
ncol(cotton)
nrow(cotton)
head(cotton)
tail(cot)

# 3.1. Create a NC data subset ----
nc <- cotton %>%
  filter(state == "NORTH CAROLINA") %>%
  select(c("year", "state", "ag_district", "county", "data_item", "value"))
#I am also only selecting the 6 revelant variables

# 3.2. Divide the data_item column ----
nc <- nc %>%
  separate(data_item, into = c("cotton_type", "measurement"), sep = " - ")


# 3.3. Convert the value column to numeric type ----
str(nc)
#By checking the structure, I can see that value is type character
nc <- nc %>%
  filter(value != "(D)")
#I filtered out any value that was equal to (D), my number of observations (rows) fell from 11227 to 11174... so there were a few (D) values in this data!!! Good riddance.
nc$value <- as.numeric(nc$value) #This redefines value as numeric type
#Let's check the structure to ensure I was successful
str(nc)
#Yay! Value is not type num!

# 4. Visualizing trends ----
  ggplot(data = nc, mapping = aes(x = year, y = value)) +
  geom_point() +
  facet_grid(rows = vars(measurement), cols = vars(ag_district), scales = "free") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90))

# 5. Summarize data from 2018 ----
#First I will create a new data subset called nc18 which only includes data in nc from the year 2018, then I will use the spread() function
nc18 <- nc %>%
  filter(year == "2018") %>%
  spread(measurement, value)
#Let's check our new columns
colnames(nc18)
#I don't like the names of our new columns, let's change those really quick so they are easier to work with
nc18 <- nc18 %>%
  rename(yield = 'YIELD, MEASURED IN LB / ACRE')
colnames(nc18)
nc18 <- nc18 %>%
  rename(acres = `ACRES HARVESTED`)
colnames(nc18)
#much better!
#Now let's mutate() the data and create a new variable, total_lbs
nc18 <- nc18 %>%
  mutate(total_lbs = acres * yield)
#Now I will look at the tibble and manually check one or two calculations to ensure R did what I wanted it to do
nc18
#Looks good! Go me!
#now let's use top_n() to filter just the top 3 results and select to only choose county and total_lbs!!!
top_n(nc18, 3, total_lbs) %>%
  select(c("county", "total_lbs"))
#The output matches the final output check provided in the homework problem, so I am DONE! Yay!