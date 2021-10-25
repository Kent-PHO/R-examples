## ---------------------------
## Script name: Explore a dataset
## Purpose of script: Use base R functions to better understand the data
##
## Author: chambm06
## Date created: 2021-10-20
## Date last updated: 
## Updated by: 
## Copyright (c) Kent Public Health Observatory, Kent County Council, 2021
## Email: kpho@kent.gov.uk
##
## ---------------------------
## Notes:
##   
## These steps will usually be done at the start of a project in the console, 
## rather than the script itself. It can be useful to use the number of rows 
## or number of columns in a data frame for data manipulation.
##
## ---------------------------


# Use the mtcars dataset. This is built into R and should always be available
# View() function will create a new tab in Rstudio to browse and filter the 
# dataset. 
View(mtcars)

# The head() function prints the first six rows of every column in the console
# but it is possible to change this default behaviour
head(mtcars)
head(mtcars, n = 10)

# Check what class of object it is
class(mtcars)

# Check the structure of each variable
str(mtcars)

# Find out the how many rows and columns it contains using dim() function
dim(mtcars)

# Alternatively use nrow() and ncol()
nrow(mtcars)
ncol(mtcars)

# Create a summary output of each variable (or column)
# Note that summary() does not apply to the row names
summary(mtcars)

# View the distrubution of a numeric variable in a histogram
hist(mtcars$mpg)

# Add more breaks if required
hist(mtcars$mpg, breaks = 20)
