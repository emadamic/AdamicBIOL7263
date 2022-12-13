library(readr)
library(tidyverse)

# Load the data 
Matt_ebird <- read_csv("Data/MBT_ebird.csv")

## Playing around 
data(mtcars)
test = as_tibble(mtcars, rownames =  "make_model") # turns the row names into a variable 

data("starwars")
sw = select(starwars, name:species) # select all cols that are not lists 
sw = select(starwars, !where(is.list)) # use where: "select var for which a function returns true"
sw = select(starwars, name, contains("color")) # use contains: like grep, any col that contains the word color 


pause(5)
