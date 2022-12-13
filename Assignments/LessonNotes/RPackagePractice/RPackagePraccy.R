library(devtools) # for create_package function 
library(roxygen2) # for documentation (? help) of your package 


# create_package("rateLawOrders")

# Run these to make sure things are good wit our package: 

document() # from devtools package, updates the package's documentation
check() # from devtools package, checks package for errors


df1 = read.csv("data_example.csv")
df2 = read.csv("data_example_2.csv")









