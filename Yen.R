library(tidyverse)

data(happy, package="productplots")
head(happy)
HAPPY <- readRDS("data/HAPPY.rds")
HAPPY$HAPPY = as.factor(HAPPY$HAPPY)

#Data cleaning: the values “IAP”, “DK” and “NA” all encode missing values. 
#Replace all of these instances by the value NA.
HAPPY = replace(HAPPY, HAPPY == "IAP", NA)
HAPPY = replace(HAPPY, HAPPY == "DK", NA)
HAPPY = replace(HAPPY, HAPPY == "NA", NA)


#Check the type of the variable and cast into the right type (factor variable for categorical variables).
#For age, change “89 OR OLDER” to 89 and assume the variable should be numeric.
str(HAPPY)
HAPPY = replace(HAPPY, HAPPY == "89 OR OLDER", "89")
HAPPY$AGE = as.numeric(HAPPY$AGE)
HAPPY$SEX = as.factor(HAPPY$SEX)
HAPPY$MARITAL = as.factor(HAPPY$MARITAL)
HAPPY$DEGREE = as.factor(HAPPY$DEGREE) %>% 
  mutate(Degree, levels = c("LT HIGH SCHOOL", "HIGH SCHOOL", "JUNIOR COLLEGE", "BACHELOR", "GRADUATE"))
HAPPY$FINRELA = as.factor(HAPPY$FINRELA)
HAPPY$HEALTH = as.factor(HAPPY$HEALTH)


