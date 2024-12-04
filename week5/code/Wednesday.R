rm(list = ls())
setwd("~/Documents/CMEECourseWork/week5/code")

d <- read.delim("../data/ObserverRepeatability.txt")
str(d)

hist(d$Tarsus)
hist(d$BillWidth)

d <- subset(d, d$Tarsus<=40)
d <- subset(d, d$Tarsus>=10)

hist(d$Tarsus)

summary(d$Tarsus)

var(d$Tarsus)

summary(d$BillWidth)

var(d$BillWidth)

require(lme4)
require(lmtest)

mT1 <- lmer(Tarsus ~ 1 + (1 | StudentID), data = d)
mT2 <- lmer(Tarsus ~ 1 + (1 | StudentID), data = d)

lrtest(mT1, mT2)

summary(mT1)
