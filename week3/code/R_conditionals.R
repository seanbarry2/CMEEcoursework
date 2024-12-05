# Checks if an integer is even
is.even <- function(n = 2) {
  # Handle NA and non-numeric input
  if (is.na(n) || !is.numeric(n)) {
    return("Input must be a numeric value.")
  }
  # Check if n is even
  if (n %% 2 == 0) {
    return(paste(n, "is even!"))
  } else {
    return(paste(n, "is odd!"))
  }
}

is.even(6)  # Example usage

# Checks if a number is a power of 2
is.power2 <- function(n = 2) {
  # Handle NA, non-numeric input, and invalid cases (negative or zero)
  if (is.na(n) || !is.numeric(n) || n <= 0) {
    return("Input must be a positive numeric value.")
  }
  # Check if n is a power of 2
  if (log2(n) %% 1 == 0) {
    return(paste(n, "is a power of 2!"))
  } else {
    return(paste(n, "is not a power of 2!"))
  }
}

is.power2(4)  # Example usage

# Checks if a number is prime
is.prime <- function(n) {
  # Handle NA, non-numeric input, and invalid cases (negative or zero)
  if (is.na(n) || !is.numeric(n) || n < 0) {
    return("Input must be a non-negative numeric value.")
  }
  if (n == 0) {
    return(paste(n, "is a zero!"))
  } else if (n == 1) {
    return(paste(n, "is just a unit!"))
  }
  
  # Check if n is prime
  ints <- 2:(n-1)
  if (length(ints) == 0 || all(n %% ints != 0)) {
    return(paste(n, "is a prime!"))
  } else {
    return(paste(n, "is a composite!"))
  }
}

is.prime(3)  # Example usage