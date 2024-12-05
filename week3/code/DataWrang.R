################################################################
################## Wrangling the Pound Hill Dataset ############
################################################################

############# Load the dataset ###############
# Load raw dataset as a matrix because it lacks proper headers
MyData <- as.matrix(read.csv("../data/PoundHillData.csv", header = FALSE))

# Load metadata with headers (separated by semicolons)
MyMetaData <- read.csv("../data/PoundHillMetaData.csv", header = TRUE, sep = ";")

############# Inspect the dataset ###############
# Initial exploration of the dataset
head(MyData)      # View the first few rows of MyData
dim(MyData)       # Check dimensions (rows and columns)
str(MyData)       # Understand the structure (e.g., data types, dimensions)
fix(MyData)       # Open an editable view of MyData (optional, for manual inspection)
fix(MyMetaData)   # Open an editable view of MyMetaData

############# Transpose ###############
# Transpose the data matrix to switch rows and columns
# Species will become column names, and treatments will be rows
MyData <- t(MyData)  
head(MyData)      # Check the transposed data
dim(MyData)       # Confirm the new dimensions

############# Replace species absences with zeros ###############
# Replace empty strings (indicating absence) with zeros for numeric analysis
MyData[MyData == ""] <- 0  

############# Convert raw matrix to data frame ###############
# Remove the first row (now a header after transposition) and convert to a data frame
# Set `stringsAsFactors = FALSE` to avoid automatic conversion of strings to factors
TempData <- as.data.frame(MyData[-1,], stringsAsFactors = FALSE)

# Assign column names from the first row of the original data
colnames(TempData) <- MyData[1,]  

############# Convert from wide to long format ###############
# Load the `reshape2` package for data reshaping
require(reshape2)  

# Use the `melt` function to transform the data from wide to long format
# `id` specifies the columns to keep as identifiers (not melted)
# `variable.name` is the new column for melted variable names (species names)
# `value.name` is the new column for melted values (species counts)
MyWrangledData <- melt(
  TempData,
  id = c("Cultivation", "Block", "Plot", "Quadrat"),
  variable.name = "Species",
  value.name = "Count"
)

# Convert relevant columns to appropriate data types
MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])

# Inspect the final wrangled dataset
str(MyWrangledData)  # Check the structure of the wrangled data
head(MyWrangledData) # View the first few rows
dim(MyWrangledData)  # Check the dimensions

############# Exploring the data (extend the script below) ###############