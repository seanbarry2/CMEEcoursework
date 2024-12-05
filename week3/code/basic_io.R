# A simple script to illustrate R input-output.
# Run line by line and check inputs/outputs to understand what is happening.

# Import the dataset with headers
MyData <- read.csv("../data/trees.csv", header = TRUE)

# Write the dataset to a new file
write.csv(MyData, "../results/MyData.csv", row.names = TRUE)  
# Includes row names in the output; this handles both saving and row naming in one step.

# Append the first row to the existing file
write.table(MyData[1,], file = "../results/MyData.csv", append = TRUE, col.names = FALSE, row.names = TRUE)
# Avoids overwriting and appends only the first row without duplicating column headers.

# Write the dataset again without column names (streamlined into a single operation)
write.table(MyData, file = "../results/MyData_no_colnames.csv", col.names = FALSE, row.names = TRUE)
# Output saved to a separate file to avoid conflicts with the initial file.