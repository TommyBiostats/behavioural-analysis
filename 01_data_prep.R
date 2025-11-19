#data loading
library(here)
path = here('data/ab_testing.csv')
df = read.csv(path)

#duplication checks
any(duplicated(df))
any(duplicated(df$User.ID))


#format changing
df$Group = factor(df$Group, levels = c('A', 'B'))
df$Conversion = as.factor(df$Conversion)
df$Device = as.factor(df$Device)
df$Location = as.factor(df$Location)
str(df)




#overview
df_cat = subset(df, select = -c(Time.Spent, User.ID))
summary(df$Time.Spent)
sapply(df_cat, table)


saveRDS(df, 'clean_data.rds')



#outcome variable: conversion
#predictor variable: group
#covariates: device, location
#marketing/visualisation suggestions: Page.Views/Time.Spent

