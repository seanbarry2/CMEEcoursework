Exponential <- function(N0 = 1, r = 1, generations = 10, debug = FALSE) {
  # Runs a simulation of exponential growth
  # Arguments:
  #   N0: Initial population size
  #   r: Growth rate
  #   generations: Number of generations to simulate
  #   debug: If TRUE, enables debugging with browser()
  # Returns:
  #   A vector of population sizes over the specified generations
  
  N <- rep(NA, generations)  # Creates a vector initialized with NA for population sizes
  
  N[1] <- N0  # Set the initial population size
  for (t in 2:generations) {
    N[t] <- N[t-1] * exp(r)  # Calculate population size for the current generation
    if (debug) browser()  # Debugging breakpoint (enabled only if debug is TRUE)
  }
  return(N)
}

# Plot the results of the Exponential function
# Debugging is disabled by default
plot(Exponential(), type = "l", main = "Exponential growth")

# In production: Ensure `debug = FALSE` or avoid using `browser()` directly
# Suggested: Use a dedicated debugging directory (`sandbox`) for exploratory testing