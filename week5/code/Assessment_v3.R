# Assesment v3
# Do larger trees budburst earlier or later than smaller trees
# Perhaps do glmm

# Required packages
require(tidyverse)
require(lubridate)
require(MASS)

# Read in main data files
phen <- read.csv("../data/phenology.csv")
girth <- read.csv("../data/girth.csv")

# Convert both tree IDs to characters
phen <- phen %>%
  mutate(TreeID = as.character(TreeID))
girth <- girth %>%
  mutate(TreeID = as.character(TreeID))

# Combining both files
girth_phen <- girth %>%
  inner_join(phen, by = "TreeID", relationship = "many-to-many")

# Writing the new dataframe into a csv document, and re-reading it to track progress
write.csv(girth_phen, "combined_files.csv")
girth_phen <- read.csv("combined_files.csv", header = T)

# Convert Date.y to a date format and extract the year to find year with largest sample size
year_counts <- girth_phen %>%
  mutate(Year = year(dmy(Date.y))) %>%  # Convert to date and extract year
  count(Year) %>%                       # Count occurrences of each year
  arrange(desc(n))                      # Arrange in descending order
year_counts # its 2013!

# Now removing columns that are irrelevant and cleaning up the file a bit
# Removing columns
girth_phen <- girth_phen %>%
  select(-X, -VisitID, -Stems, -HeightGirth_cm, -Estimated, -TreeForm, -remarks)

# Cleaning up Score column, and rounding "greater than" (>) up, and "less than" (<) down
girth_phen$Score <- gsub("[<>]", "", girth_phen$Score)
girth_phen <- girth_phen[!grepl("\\$", girth_phen$Score), ]
girth_phen <- girth_phen[!grepl("[789]", girth_phen$Score), ]

# Removing all rows that aren't in 2013
# Date.y
girth_phen <- girth_phen %>%
  mutate(Year = year(dmy(Date.y))) %>% # Convert Date.y to date and extract year
  filter(Year == 2013) %>% # Keeps rows where date is 2013
  select(-Year) # Removes the new "year" column that we extracted

# Date.x (much more complicated)
# Standardize Date.x to contain only years
girth_phen <- girth_phen %>%
  mutate(Date.x = ifelse(grepl("/", Date.x), format(dmy(Date.x), "%Y"),  Date.x))

# Expand date ranges and filter for 2013
girth_phen <- girth_phen %>%
  separate(Date.x, into = c("StartYear", "EndYear"), sep = "-", convert = TRUE, remove = FALSE) %>%  # Split Date.x into its constituent years, but keep Date.x as a column
  mutate(EndYear = ifelse(is.na(EndYear), StartYear, EndYear)) %>%  # Handle single years
  filter(StartYear <= 2013 & EndYear >= 2013) %>%  # Keep rows where 2013 is within the range
  select(-StartYear, -EndYear)  # Remove temporary columns

# If we want to manually check that the date ranges are correct we can do that now
# Once done, remove the unnecessary column Date.x
girth_phen <- girth_phen %>%
  select(-Date.x)

# Now we are removing all rows that don't have a score of 1 (this is what we are interested in)
# Find the first date each tree has achieved 'budburst' (Score = 1)
first_budburst <- girth_phen %>%
  filter(Score == 1) %>%
  group_by(TreeID) %>%
  summarize(BudburstDate = min(Date.y), .groups = "drop")

# Join this new information back to the 'girth_phen' data frame
girth_phen <- girth_phen %>%
  left_join(first_budburst, by = "TreeID")

# Now remove all 'NA' values (including Trees that skipped a score of 1)
girth_phen <- girth_phen %>%
  filter(!is.na(BudburstDate))

# Now converting the dates into Julian days (days since Jan. 1st)
girth_phen$JulianDate <- yday(as.Date(girth_phen$BudburstDate, format = "%d/%m/%Y"))

# Just cleaning up the data frame by removing all non-1 scores, and removing columns that are now irrelevant (this is optional)
girth_phen <- girth_phen %>%
  filter(Score == 1)
girth_phen <- girth_phen %>%
  select(-Date.y, -BudburstDate, -Score)

# Data has been wrangled! Now for the analysis
# Again writing and reading a new file to keep track of things
write.csv(girth_phen, "wrangled_girth_phen.csv")
data <- read.csv("wrangled_girth_phen.csv", header = T, row.names = NULL)

# Histogram of logged response variable, looks gaussian!
hist(log(data$JulianDate))

# Plotting the glm
ggplot(data, aes(x = Girth_cm, y = log(JulianDate))) +
  geom_point() +  
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    x = "Tree Girth (cm)", 
    y = "Log Budburst Day (Julian Days)", 
    title = "Relationship between Tree Girth and Budburst"
  ) +
  theme_minimal()

# Making the glm
glm_model <- glm(log(JulianDate) ~ Girth_cm, family = "gaussian", data = data)
summary(glm_model)

# Checking assumptions
par(mfrow=c(2,2))
plot(glm_model)
par(mfrow=c(1,1))
