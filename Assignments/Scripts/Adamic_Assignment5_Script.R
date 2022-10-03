# Adamic_Assignment5_Script
# This script has all the code, and can be run in one piece, shown in the html of the same name. 

################################################################################

# load libraries
library(RCurl)
library(tidyverse)

# download data from github 
x = RCurl::getURL("https://raw.githubusercontent.com/mbtoomey/Biol_7263/main/Data/assignment6part1.csv")
df1 = read.csv(text=x)

x = RCurl::getURL("https://raw.githubusercontent.com/mbtoomey/Biol_7263/main/Data/assignment6part2.csv")
df2 = read.csv(text=x)


# clean df 1 - separate headers by _ 
df1.clean = df1 %>% pivot_longer(cols = Sample1_Male_Control:Sample20_Female_Treatment,
                                 names_to = c("sample_name", "sex", "group"), 
                                 names_sep = "_") 
df1.sex = df1.clean %>% dplyr::select(sample_name, sex) %>% unique() # separate sex because this is a non-numeric - 
df1.clean = df1.clean %>% dplyr::select(-sex)


# clean df 2 - separate headers by ., with \\. escape of the period 
df2.clean = df2 %>% pivot_longer( cols = Sample16.Treatment:Sample13.Control, 
                                  names_to = c("sample_name", "group"), 
                                  names_sep = "\\.") 

df.clean = bind_rows(df1.clean, df2.clean) # bind the first and second together 
df.clean = left_join(df.clean, df1.sex) # add sex information to df clean 


# Calculate mass/body length for everyone - do this using a wide df  
df.clean.wide = df.clean %>% filter(ID != "age") %>% 
  pivot_wider(names_from = ID, values_from=value) %>%
  na.omit() %>%  # missing some mass values... 
  mutate(residual_mass = mass/body_length)

# group by and summarise the mean of this mass/body length 
df.clean.wide.group = df.clean.wide %>% group_by(group, sex) %>% 
  summarise(Mean = mean(residual_mass, na.rm=T), 
            SD = sd(residual_mass, na.rm=T))


# write.csv(df.clean.wide.group, "Results/residual_mass_group.csv")

