## Build a random matrix
M <- matrix(rnorm(100), 10, 10)  # Generate a 10x10 matrix with random normal values

## Take the mean of each row
RowMeans <- apply(M, 1, mean)  # Apply the `mean` function to each row (margin = 1)
print(RowMeans)  # Print the mean values for each row

## Calculate the variance of each row
RowVars <- apply(M, 1, var)  # Apply the `var` function to each row (margin = 1)
print(RowVars)  # Print the variance values for each row

## Calculate the mean of each column
ColMeans <- apply(M, 2, mean)  # Apply the `mean` function to each column (margin = 2)
print(ColMeans)  # Print the mean values for each column
