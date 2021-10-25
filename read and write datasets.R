## ---------------------------
## Script name: Read and write datasets
## Purpose of script: Demonstrate most common methods
##
## Author: chambm06
## Date created: 2021-10-19
## Date last updated: 
## Updated by: 
## Copyright (c) Kent Public Health Observatory, Kent County Council, 2021
## Email: kpho@kent.gov.uk
##
## ---------------------------
## Notes:
##   
## This example will involve using one of the datasets available within R. It 
## will be written to a local folder, then read back into R
##
## The Excel reading and writing will be performed using the openxlsx package
## Other options to work with Excel files:
## readxl - https://readxl.tidyverse.org/
## writexl - https://cran.r-project.org/web/packages/writexl/index.html
## XLConnect - https://cran.r-project.org/web/packages/XLConnect/index.html
## Please note that XLConnect package requires Java
## ---------------------------

# Load packages
library(openxlsx)


# Set your working directory to a location where you have write permissions
# In Rstudio, go to Session, Set Working Directory, Choose Directory ...

# This is how to check or get your current working directory
getwd()

# Use the mtcars dataset. This is built into R and should always be available
View(mtcars)

## ---- csv files ---- ##
# 
# For help on this function, type ?read.csv in R console
write.csv(x = mtcars,  # the name of the dataframe object we want to write
          file = "mtcars.csv",  # what to name the file
          row.names = FALSE)  # whether to include the row names

# Read this file back into R and assign it to a new object
# The comment.char argument is useful if you want to add comments to csv file
# above data. These will be ignored if they start with the character specified.
# Be careful not to include commas in the lines reserved for comments in the
# csv file
x <- read.csv(file = "mtcars.csv", 
              skip = 0,  # increase this value to skip the first n rows
              comment.char = "#") 

# A new x dataframe object should now exist in the R environment

## ---- Excel files ---- ##

# For help on this function, type ?read.csv in R console
write.xlsx(x = mtcars, 
           file = "mtcars.xlsx", 
           overwrite = TRUE)  # Choose whether to overwrite an existing file

# Read this file back into R and assign it to a new object
y <- read.xlsx(xlsxFile = "mtcars.xlsx")

# The line of code above works because it assumes the data is stored in sheet 1
# and starts in the first row and first column. These assumptions and other 
# settings can be changed within the read.xlsx() function. See the help page by 
# typing ?read.xlsx into the console.


## ---- Rds files ---- ##
## 
## Rds files are an efficient means of storing a single R object. The default 
## saves the file with gzip compression, so is generally a smaller file size 
## compared to Excel or csv. It is usually slightly faster to read into memory
## too. This file type keeps all the R specific information encoded in the data 
## such as variable type. This saves time and helps ensure consistency.
 
saveRDS(object = mtcars, 
        file = "mtcars.Rds")

z <-  readRDS(file = "mtcars.Rds")

## ---- Rda files ---- ##
## 
## Rda (or Rdata) files share the advantages of Rds files but in addition, they 
## can be used to save multiple R objects in one place. When the Rda file is 
## loaded back into R from file, the original object names will be retained. 
## This requires a degree of caution in case existing objects are overwritten. 
## Use Rds files for the flexibility to assign the object to a specific object.
## 
## To demonstrate how Rda files work, let's split the first three variables of 
## the mtcars dataset into three separate vectors.

mpg <- mtcars$mpg
cyl <- mtcars$cyl
disp <- mtcars$disp

# Use the save() function 
save(mpg, cyl, disp, 
     file = "mtcars_vectors.Rda")

# Before loading them back, remove the three objects from the R environment
rm(mpg, cyl, disp)

# Load the vectors from file
load(file = "mtcars_vectors.Rda")


## ---- SPSS or Stata files ---- ##
##
## Use the appropriate functions within the foreign package
## 
## read.spss()
## read.dta()
##   