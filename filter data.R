## ---------------------------
## Script name: filter data.R
## Purpose of script: Demonstrate different ways of achieving the same end
##
## Author: ChambM06
## Date created: 2024-02-08
## Date last updated: 
## Updated by: 
## Copyright (c) Kent Public Health Observatory, Kent County Council, 2024
## Email: kpho@kent.gov.uk
##
## ---------------------------
## Notes:
##   
##
##
##
##
## ---------------------------


# We'll use the iris dataset for this example. It comes loaded with Base R.
View(iris)

# One approach is to use the square brackets. Similar to logical vector example
# The iris dataset is a data frame with two dimensions (rows and columns)
# Inside the square brackets, I first specify the conditions for row filters
# Then use a comma with nothing after it which means keep all columns
new_df <- iris[iris$Species == "setosa", ]  # remember R is case-sensitive

# Another option is to use the subset() function in base R
# This function also has an argument to select columns. Type ?subset in console
# to view help pages.
new_df2 <- subset(x = iris, subset = Sepal.Length < 5)

# Shouldn't forget about dplyr
# It can be easier to follow, especially if you need to do intermediary calcs
# before filtering
# I've used the base pipe operator here rather than magrittr pipe.
# Shortcut is ctrl + shift + M keys.
library(dplyr)
new_df3 <- iris |> 
  mutate(Sepal_area_est = (Sepal.Length * Sepal.Width / 2)) |> 
  filter(Sepal_area_est > 10)


