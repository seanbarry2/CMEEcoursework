# Stats in R assessment

# Do larger trees budburst earlier or later than smaller trees

require(tidyverse)

phen <- read.csv("../data/phenology.csv")
girth <- read.csv("../data/girth.csv")
trees <- read.csv("../data/trees.csv")

girth <- girth %>%
  mutate(Date = ifelse(grepl("/", Date), format(as.Date(Date, format = "%d/%m/%Y"), "%Y"), Date))

girth_expanded <- girth %>%
  separate(Date, into = c("StartYear", "EndYear"), sep = "-", convert = TRUE) %>%
  # Filter out rows where EndYear is NA (i.e., single years)
  filter(!is.na(EndYear)) %>%
  rowwise() %>%
  mutate(Year = list(seq(StartYear, EndYear))) %>%
  unnest(Year) %>%
  select(-StartYear, -EndYear)

write.csv(girth_expanded, file = "girth_filtered.csv")

girth_f <- read.csv("girth_filtered.csv", header = TRUE)

girth_single_years <- girth %>%
  separate(Date, into = c("StartYear", "EndYear"), sep = "-", convert = TRUE) %>%
  filter(is.na(EndYear)) %>%
  # Copy the single year into a new Year column
  mutate(Year = StartYear) %>%
  select(-StartYear, -EndYear)

girth_combined <- bind_rows(girth_expanded, girth_single_years)

write.csv(girth_combined, "girth_with_single_years.csv", row.names = FALSE)

girth_years <- read.csv("girth_with_single_years.csv", header = TRUE)

nrow(girth_years)
nrow(girth_f)

phen$Date <- as.Date(phen$Date, format = "%d/%m/%Y")

phen <- phen %>%
  mutate(Year = format(Date, "%Y"))

write.csv(phen, file = "phen_years.csv")

phen_years <- read.csv("phen_years.csv", header = TRUE)

phen_years <- phen_years %>%
  mutate(TreeID = as.character(TreeID))

girth_years <- girth_years %>%
  mutate(TreeID = as.character(TreeID))

combined_data <- phen_years %>%
  left_join(girth_years, by = c("TreeID", "Year"))

View(combined_data)

cleaned_data <- combined_data %>%
  +     select(-X.x, -remarks, -X.y, -Stems, -HeightGirth_cm, -Estimated)

write.csv(cleaned_data, "cleaned_data.csv", row.names = FALSE)

cleaned_data <- read.csv("cleaned_data.csv", header = TRUE)

cleaned_data <- cleaned_data %>%
  filter(!is.na(Girth_cm))

write.csv(cleaned_data, "cleaned_data_no_na_girth.csv", row.names = FALSE)

no_nas_girth <- read.csv("cleaned_data_no_na_girth.csv", header = TRUE)

no_nas_girth$Score <- gsub("[<>]", "", no_nas_girth$Score)
no_nas_girth <- no_nas_girth[!grepl("\\$", no_nas_girth$Score), ]
no_nas_girth <- no_nas_girth[!grepl("[789]", no_nas_girth$Score), ]

no_nas_girth <- no_nas_girth %>%
  mutate(Score = as.numeric(Score))

avg_scores <- aggregate(Score ~ TreeID + Girth_cm, data = no_nas_girth, FUN = mean)

write.csv(avg_scores, "averages_and_girth.csv")

avg_scores <- read.csv("averages_and_girth.csv", header = TRUE)

lm_model <- lm(Score ~ Girth_cm, data = avg_scores, family = gaussian())
summary(lm_model)

ggplot(avg_scores, aes(x = Girth_cm, y = Score)) +
  geom_point() +  # Scatter plot of data points
  geom_smooth(method = "lm", se = TRUE) +  # Linear model fit with confidence interval
  labs(x = "Tree Girth (cm)", y = "Average Budburst Score", 
       title = "Relationship between Tree Girth and Budburst Score") +
  theme_minimal()
########################################
year_counts <- table(no_nas_girth$Year)
print(year_counts)

twennythirteen <- subset(no_nas_girth, Year == 2013)

# Load necessary packages
library(dplyr)
library(lubridate)

# Ensure Date is in the correct format
twennythirteen$Date <- as.Date(twennythirteen$Date, format = "%Y-%m-%d")

# Find the first date each tree reaches a score greater than 1
first_budburst <- twennythirteen %>%
  filter(Score > 1) %>%
  group_by(TreeID) %>%
  summarize(BudburstDate = min(Date), .groups = "drop")

# Join this new information back to the original dataframe
twennythirteen <- twennythirteen %>%
  left_join(first_budburst, by = "TreeID")

# View the updated dataframe
head(twennythirteen)

twennythirteen$JulianDate <- yday(as.Date(twennythirteen$BudburstDate, format = "%Y-%m-%d"))

lm_model1 <- lm(JulianDate ~ Girth_cm, data = twennythirteen)
summary(lm_model1)

ggplot(twennythirteen, aes(x = Girth_cm, y = JulianDate)) +
  geom_point() +  # Scatter plot of data points
  geom_smooth(method = "lm", se = TRUE) +  # Linear model fit with confidence interval
  labs(
    x = "Tree Girth (cm)", 
    y = "First Budburst Day", 
    title = "Relationship between Tree Girth and Budburst Start"
  ) +
  theme_minimal()

summary(twennythirteen$JulianDate)

par(mfrow=c(2,2))
plot(lm_model1)

par(mfrow=c(1,1))
cor(log(twennythirteen$Girth_cm), twennythirteen$JulianDate, method = "spearman", use = "complete.obs")

######
glm_model <- glm(JulianDate ~ log(Girth_cm), data = twennythirteen)
summary(glm_model)

# Convert Date column to Date format
twennythirteen$Date <- as.Date(twennythirteen$Date, format = "%Y-%m-%d")

# Find the first date each tree reaches a score of exactly 1
first_budburst <- twennythirteen %>%
  filter(Score == 1) %>%
  group_by(TreeID) %>%
  summarize(BudburstDate = min(Date), .groups = "drop")

# Join this new information back to the original dataframe
twennythirteen <- twennythirteen %>%
  left_join(first_budburst, by = "TreeID")

twennythirteen$JulianDate <- yday(as.Date(twennythirteen$BudburstDate, format = "%Y-%m-%d"))

final_data <- twennythirteen %>%
  group_by(TreeID) %>%
  summarize(
    Girth_cm = mean(Girth_cm, na.rm = TRUE),      # Calculate mean Girth_cm for each TreeID
    JulianDate = mean(JulianDate, na.rm = TRUE)    # Calculate mean JulianDate for each TreeID
  ) %>%
  ungroup()

# Save the summarized data to a new CSV file
write.csv(final_data, "final_data.csv", row.names = FALSE)

data <- read.csv("final_data.csv", header = T)

glm_model <- glm(JulianDate ~ log(Girth_cm), data = na.omit(data))
summary(glm_model)

par(mfrow=c(2,2))
plot(lm_model1)
par(mfrow=c(1,1))