########################################################################################
# Summary: Land application of nitrogen and phosphorus
# Date: September 25, 2019
# Data analyzed in this session are from the US Geological Survey and include total 
# nitrogen (N) and phosphorus (P) mass (kg) applied to the land surface via livestock 
# (confined and unconfined) manure in the years 1982, 1987, 1992, and 1997.  Measurements 
# are reported at the county-scale across the US. The total land areas (sq. km) over which 
# nutrients were applied are also reported per county. The data can be accessed from USGS 
# Scientific Investigations Report  2006-5012, "County-Level Estimates of Nutrient Inputs 
# to the Land Surface of the Conterminous United States, 1982-2001" 
# (https://pubs.usgs.gov/sir/2006/5012/) by Barbara C. Ruddy, David L. Lorenz, and David K. 
# Mueller.
########################################################################################

# Motivating question ----
### Which NC counties, on average over the period of record, have the highest rates of N and P input relative to different application types?

# Clear workspace & load packages ----
rm(list=ls(all=TRUE))
library(tidyverse)

# Read & inspect the dataset ----
nut <- read_csv("data/nutrient-inputs-reformatted.csv")

## Tidy data ----
# 1. Gather and separate columns

# 2. Convert year to numeric

# 3. Handle NAs

# 4. Create a NC subset
  
# Visualize ----

# Summarize ----
### Which NC counties, on average over the period of record, have the highest rates of N and P input relative to different application types?