data <- read.table("data/Sparrowsize.txt")

mean_bill <- mean(data$Bill, na.rm = TRUE)
var_bill <- var(data$Bill, na.rm = TRUE)
sd_bill <- sd(data$Bill, na.rm = TRUE)
mean_bm <- mean(data$Mass, na.rm = TRUE)
var_bm <- var(data$Mass, na.rm = TRUE)
sd_bm <- sd(data$Mass, na.rm = TRUE)
mean_wing <- mean(data$Wing, na.rm = TRUE)
var_wing <- var(data$Wing, na.rm = TRUE)
sd_wing <- sd(data$Wing, na.rm = TRUE)

par(mfrow = c(2, 2))
hist(data$Tarsus, breaks = 3, col="grey")
hist(data$Tarsus, breaks = 10, col="grey")
hist(data$Tarsus, breaks = 30, col="grey")
hist(data$Tarsus, breaks = 100, col="grey")

## Sum of squares:
# A statistical measure that quantifies variability of a dataset relative to the mean.

## What are NAs
# Lack of data entries

## How to deal with NA's
# na.rm = TRUE

## Why are there gaps in the histograms when breaks are larger
# It makes R set a lower binwidth so that data is more detailed/granular. Larger binwidths means that each bar 'captures' more data

## What do the gaps say about how precise we should report results
# Ideally there wouldn't be large gaps in a histogram, so results should be reported on a 'macro' level

## Explain warning when doing mlv(d2$Tarsus)
# Dunno

## What is the variance of normally distributed data with a mean of 0 and a standard deviation of 1?
## What is the function in R to z-standardize data?
## Explain what quantiles are
## What are the boxes, whiskers and circles in a boxplot?
## Explain the terms: sums of squares, mean of sum of squares