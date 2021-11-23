############################################################################
# Author: Jenine K. Harris        
# Date last edited: Nov 23, 2021
# Data source: mtcars built-in data
# Contact info: harrisj@wustl.edu
# URL of code: https://github.com/jenineharris/logistic-regression-tutorial
############################################################################

# before running code, install packages through the tools menu
# packages to install: tidyverse, table1, finalfit, knitr, odds.n.ends, car
# open packages using the library function
library(package = "tidyverse")
library(package = "table1")
library(package = "finalfit")
library(package = "knitr")

# using built-in cars data set, changing variable names for example
# data cleaning and management 
lungCancer <- mtcars$vs
yearsSmoke <- mtcars$mpg
bmi <- mtcars$am 
lungCancerData <- data.frame(lungCancer, yearsSmoke, bmi)
lungCancerData <- lungCancerData %>% 
  mutate(bmi = recode_factor(bmi, 
                         '0' = "Underweight or Normal", 
                         '1' = "Overweight or Obese")) %>% 
  mutate(lungCancer = recode_factor(lungCancer, 
                         '0' = "No Lung Cancer Diagnosis", 
                         '1' = "Yes Lung Cancer Diagnosis"))

label(lungCancerData$yearsSmoke) <- "Years of cigarette smoking"
label(lungCancerData$bmi) <- "Body mass index category"
label(lungCancerData$lungCancer) <- "Ever diagnosed with lung cancer"

# STEP 1: EXPLORATORY DATA ANALYSIS

# histogram of years smoking
yearsHisto <- lungCancerData %>%
    ggplot(aes(x = yearsSmoke)) +
    geom_histogram(bins = 8, color = 'white') +
    theme_minimal(base_size = 14, base_family = "serif") +
    labs(x = "Years of cigarette smoking", y = "Frequency")
yearsHisto

# table 1: basic table of lung cancer, years smoking, bmi
tableDesc <- lungCancerData %>% 
  summary_factorlist(explanatory = c('lungCancer',
                                     'yearsSmoke',
                                     'bmi'), 
         cont = "median")

table1 <- kable(tableDesc, row.names=FALSE,
      col.names = c("Characteristic",
                    "Category",
                    "n (%)"),
      align=c("l", "l", "r"))

table1

# table 2: crosstabs of lung cancer, years smoking, bmi
tableInf <- lungCancerData %>% 
  summary_factorlist(dependent = c('lungCancer'),
                     explanatory = c('yearsSmoke',
                                     'bmi'), 
         cont = "median")

table2<-kable(tableInf, row.names=FALSE,
       col.names = c("Lung Cancer",
                     "",
                     "No",
                     "Yes"),
      align=c("l", "l", "r", "r"))

table2

# STEP 2 & 3: ESTIMATE THE MODELS & ASSUMPTION CHECKING

# need to estimate the models in order to check the assumptions

# estimate the model with just years of smoking
lungCancMod <- glm(lungCancer ~ (yearsSmoke), data = lungCancerData, family = binomial("logit"))

# estimate the full model
lungCancModBig <- glm(lungCancer ~ yearsSmoke + bmi, data = lungCancerData, family = binomial("logit"))

# check VIF for no perfect multicollinearity assumption
car::vif(lungCancModBig)

# check linearity for the yearsSmoke variable
# make a variable of the logit of the predicted values
logit.use <- log(lungCancModBig$fitted.values/(1-lungCancModBig$fitted.values))

# make a small data frame with the logit variable and the yearsSmoke predictor
linearity.data <- data.frame(logit.use, age = lungCancModBig$model$yearsSmoke)

# create a plot with linear and actual relationships shown
linearPlot <- linearity.data %>%
  ggplot(aes(x = yearsSmoke, y = logit.use))+
  geom_point(aes(size = "Observation"), color = "gray50", alpha = .6) +
  geom_smooth(se = FALSE, aes(color = "Loess curve")) + 
  geom_smooth(method = lm, se = FALSE, aes(color = "linear")) + 
  theme_minimal(base_size = 14, base_family = "serif") +
  labs(x = "Years of smoking", y = "Log-odds of lung cancer predicted probability") +
  scale_color_manual(name="Type of fit line", values=c("gray50", "black")) +
  scale_size_manual(values = 1.5, name = "")
linearPlot

# STEP 4: REPORT THE LOGISTIC REGRESSION RESULTS 

# small model results
lungCancModORCI <- odds.n.ends::odds.n.ends(lungCancMod)
CI <- lungCancModORCI$`Predictor odds ratios and 95% CI`
CI

# big model results
lungCancModBigOR <- odds.n.ends::odds.n.ends(lungCancModBig)
bigCI <- lungCancModBigOR$`Predictor odds ratios and 95% CI` 
bigCI

# model fit
modfit <- lungCancModORCI$`Count R-squared (model fit): percent correctly predicted`
modfit