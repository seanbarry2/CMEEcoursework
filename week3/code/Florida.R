# Florida.R

# good practice
rm(list = ls())

# load data and visualize
load("../data/KeyWestAnnualMeanTemperature.RData")
plot(ats)

# computing observed correlation coefficient
YearTempCor <- cor(ats$Year, ats$Temp, use = "everything", method = "pearson")
paste(YearTempCor)

set.seed(22042002) # setting seed for reproducibility

n_iter <- 1000 # Number of random shuffles
random_corrs <- numeric(n_iter)

for (i in 1:n_iter) {
  shuffled_temp <- sample(ats$Temp) # shuffle temp
  random_corrs[i] <- cor(ats$Year, shuffled_temp, method = "pearson")
}

# each correlation is stored and can be viewed with print(random_corrs)
# calculate p value
p_value <- mean(random_corrs >= YearTempCor)
paste(p_value)P

# Answers for write-up
# YearTempCor = 0.533178398401887
# P-value = 0