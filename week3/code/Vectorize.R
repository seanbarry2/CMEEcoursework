# Create a 1000x1000 matrix with random values
M <- matrix(runif(1000000), 1000, 1000)

# Function to sum all elements of a matrix using nested loops
SumAllElements <- function(M) {
  Dimensions <- dim(M)  # Get the dimensions of the matrix
  Tot <- 0  # Initialize the total sum to 0
  for (i in 1:Dimensions[1]) {  # Loop through rows
    for (j in 1:Dimensions[2]) {  # Loop through columns
      Tot <- Tot + M[i, j]  # Add each element to the total
    }
  }
  return(Tot)  # Return the total sum
}

# Measure the time taken for summation using nested loops
print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))  
# Loops are significantly slower because each element is accessed individually, which involves repeated memory access.

# Measure the time taken for summation using the built-in vectorized function
print("Using the in-built vectorized function, the time taken is:")
print(system.time(sum(M)))  
# Vectorized operations are faster because they use optimized basic code that processes multiple elements simultaneously without loops.