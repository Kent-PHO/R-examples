## ---------------------------
## Script name: create new dataframe
## Purpose of script: demonstrate how to use r function to create a new data
## frame from scratch
##
## Author: chambm06
## Date created: 2021-10-18
## Date last updated: 
## Updated by: 
## Copyright (c) Kent Public Health Observatory, Kent County Council, 2021
## Email: kpho@kent.gov.uk
##
## ---------------------------
## Notes:
##   
## Usually, data frames will be read directly into R from another source such 
## as a csv, excel or sql database.Creating a new dataframe within R can 
## sometimes be useful for data processing such as creating a lookup table.
##
## ---------------------------

# Create the data frame within R using data.frame() function
# Assign it to an object. In this case, called 'x' but it can be called 
# anything (within reason). Short names are generally preferable.
# 
# In the example below, there are four variables called disease, admissions, 
# rate and obesity.related. Each one is written out followed by equals sign, 
# then the combine function is used to define the values in each of three rows.
# Note the open and closed brackets and use of commas to separate values and 
# variables. R is extremely fussy about syntax.
# 
x <- data.frame(disease = c("Diabetes", "CHD", "COPD"),  # character variable
                admissions = c(100L, 150L, 200L),  # integer variable
                rate = c(56.4, 72.0, 85.1),  # numeric variable
                obesity.related = c(TRUE, TRUE, FALSE))  # logical variable

# View x 
View(x)

# Check the structure of x data frame 
str(x)

# Change disease variable from character to factor
# This can be useful for data manipulation and plotting but is optional in this 
# case
x$disease <- factor(x$disease)

# Check the new structure of x data frame 
str(x)
