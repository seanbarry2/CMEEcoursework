# Function to perform an operation with error handling
doit <- function(x) {
  temp_x <- sample(x, replace = TRUE)  # Create a sample with replacement
  if (length(unique(temp_x)) > 30) {  # Check if the sample has sufficient unique values
    print(paste("Mean of this sample was:", as.character(mean(temp_x))))
  } else {
    stop("Couldn't calculate mean: too few unique values!")  # Trigger an error
  }
}

# Set seed for reproducibility
set.seed(1345)

# Generate a population of random normal values
popn <- rnorm(50)

# Visualize the population
hist(popn)

# Demonstrate error handling using `tryCatch()`
result <- vector("list", 15)  # Preallocate a list for results
for (i in 1:15) {
  result[[i]] <- tryCatch(
    expr = doit(popn),  # Attempt to run the function
    error = function(e) {
      # Handle errors by returning the error message
      message(paste("Error in iteration", i, ":", e$message))
      return(NULL)  # Return NULL for failed iterations
    },
    finally = {
      # Code here will run regardless of success or failure
      message(paste("Iteration", i, "completed."))
    }
  )
}

# Examine the result list
class(result)

# Explanation of `tryCatch` usage:
# - `expr`: The main code to execute (`doit(popn)` in this case).
# - `error`: A handler function that runs if an error occurs, allowing custom messages or alternative actions.
# - `finally`: Optional code that executes at the end of each iteration, regardless of success or failure.

# Notes:
# 1. `try()` is simpler but less flexible. It captures errors without allowing detailed handling.
# 2. `tryCatch()` provides more granular control, enabling custom responses to errors.
