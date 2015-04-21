### Haggis population density in the Scottish Highlands.
### S. Johnston, University of Edinburgh.

# Load libraries, set working directory, and load data files

library(ggplot2)

hds <- read.table("data/haggis_density.txt", header = T)
head(hds)

# Conduct a linear regression of Population Size by Year

fit1 <- lm(PopSize ~ Year, data = hds)

# What is the slope?

fit1$coefficients

slope <- fit1$coefficients[2]

# What is the P-value?

summary(fit1)$coefficients

pval <- summary(fit1)$coefficients["Year", "Pr(>|t|)"]

# Plot the regression

ggplot(hds, aes(Year, PopSize)) +
  geom_point() + 
  stat_smooth(method = "lm")


