###IMPORTANT STUFF###

# Mean
# sum of all values divided by n
# average value of dataset
mean(data$column, na.rm = TRUE) #na.rm removes all NAs

# Median
# n divided by 2 basically
# middle point of the dataset
median(data$column, na.rm = TRUE)

# Mode
# simply the most frequent value in the column
mode(data$column, na.rm = TRUE)

# Range
# maximum and minimum values
range(data$column, na.rm = TRUE)

# Length
# basically just n
length(data$column)

# Variance
# measures spread of data points from the mean
# each deviation from the average is squared and
# summed up, then divided by the total amount of values
# (minus one if we have a sample from a population)
var(data$column)
# which is the same as:
sum((data$column - mean(data$column))^2) / (length(data$column) - 1)

# Standard deviation (sqrt variance)
# measures spread of data points around mean
# each deviation from the average is squared and
# summed up, then divided by the total amount of values
# (minus one if we have a sample from a population)
# then square root of all of it is taken
sd(data$column)

# Covariance
# describes combined variance of 2 datasets
# basically just meausres spread of data points from mean
# then multiplies them together for each group
# then divided by n (-1)
# the further the covariance is from 0, the steeper the slope
cov(data$column1, data$column2)

# Correlation coefficient
# basically just the covariance of 2 groups divided by
# standard deviation of group1 * standard deviation of group2
cor(data$column1, data$column2)

# Standard error
# indicates how much the sample is expected to vary if multiple new samples were taken from the population (small standard erorr is good)
# standard deviation divided by square root of n
SE <- sqrt(var(data$column) / length(data$column))

# T-test (2-sample)
# compares means of two groups to determine if they differ significantly
# basically mean of group 1 minus mean of group 2
# divided by (square root of (variance group1 / n1) + (variance group2 / n2))
t.test(data$column1, data$column2)

# *How do i determine what a good sample size should be?*
# Power analysis
# d = (mean1 - mean2) / standard deviation of both groups pooled together
# power = 0.8 (just a good standard, it means that there's an 80% chance of correctly detecting a true effect)
# type = specifies what type of t-test
# alternative = specifies that the difference could be in both directions (either group could have a larger mean)
wp.t(d = xyz, power = 0.8, type = "two.sample", alternative = "two.sided")

# REGRESSIONS (linear only)
# basically creates a line through data with the shortest total distance
# from each data point
# spits out intercept estimate (where the line touches x = 0)
# spits out slope estimate (the increase or decrease of y for each step of x)
# spits out residual standard error (average distance from data points to the regression line)
# spits out R-squared (how well the data fits the line)
# spits out f-stat (how well the variance in y is explained by model)
linear_model <- lm(column1 ~ column2, data = data) #column1 is response, column2 is predictor
summary(linear_model)

# ANOVA
# used to test if there is a difference in means between 3 or more groups
# a significant f-ratio indicates that there is a difference in group means
linear_model <- lm(column1 ~ column2, data = data)
anova(linear_model)