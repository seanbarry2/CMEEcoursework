# Function without preallocation
NoPreallocFun <- function(x) {
  a <- vector()  # Initialize an empty vector
  for (i in 1:x) {
    a <- c(a, i)  # Concatenate the current value to the vector
    # Note: Concatenation creates a new copy of the vector each time,
    # which is computationally expensive for large vectors.
  }
}

# Measure the time taken for the function without preallocation
system.time(NoPreallocFun(1000))  
# Expectation: Slower execution time due to repeated memory reallocation.

# Function with preallocation
PreallocFun <- function(x) {
  a <- rep(NA, x)  # Pre-allocate a vector of the required size
  for (i in 1:x) {
    a[i] <- i  # Assign values directly to the pre-allocated vector
    # Note: Preallocation avoids repeated memory reallocation,
    # leading to significant performance improvement for large vectors.
  }
}

# Measure the time taken for the function with preallocation
system.time(PreallocFun(1000))  
# Expectation: Faster execution time due to efficient memory usage.

# Summary of Timing Differences:
# 1. Without preallocation (`NoPreallocFun`), execution time increases significantly 
#    as the vector size grows because R repeatedly reallocates memory.
# 2. With preallocation (`PreallocFun`), execution is much faster as memory is allocated
#    only once, and values are directly assigned to the pre-allocated vector.
