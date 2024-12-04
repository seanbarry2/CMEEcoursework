#Multiple regression with timber.txt
timber <- read.delim("../data/timber.txt")
summary(timber)
str(timber)
head(timber)

par(mfrow = c(2, 2))
boxplot(timber$volume)
boxplot(timber$girth)
boxplot(timber$height)

var(timber$volume)
var(timber$girth)
var(timber$height)

t2 <- as.data.frame(subset(timber, timber$volume!="NA"))
t2$z.grith <- scale(timber$girth)
t2$z.height <- scale(timber$height)

plot(t2)

par(mfrow = c(2, 2))
hist(t2$volume)
hist(t2$girth)
hist(t2$height)

pairs(timber)

cor(timber)

summary(lm(girth ~ height, data = timber))

VIF <- 1/(1-0.27)
VIF
sqrt(VIF)

pairs(t2)
cor(t2)

timberMod <- lm(volume ~ girth + height, data = timber)
anova(timberMod)
summary(timberMod)

plot(timberMod)