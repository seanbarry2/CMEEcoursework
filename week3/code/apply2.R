# A function that performs a conditional operation on a vector
SomeOperation <- function(v) { 
  # Check if the sum of the elements in the vector `v` is greater than 0
  if (sum(v) > 0) { 
    # If the condition is true, multiply all elements in `v` by 100
    return(v * 100)  
  } else { 
    # If the condition is false, return the original vector `v` unchanged
    return(v)  
  }
}

# Create a 10x10 matrix with random normal values
M <- matrix(rnorm(100), 10, 10)

# Apply `SomeOperation` to each row of the matrix `M`
# The margin `1` specifies that the function is applied to rows (not columns)
print(apply(M, 1, SomeOperation))  
# Output: A matrix where each row is transformed based on the sum of its elements.
# Rows with a positive sum have their values scaled by 100; others remain unchanged.
