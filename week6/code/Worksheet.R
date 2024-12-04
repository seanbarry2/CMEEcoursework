# Worksheet to keep track of chatgpt code inputs
# Question 0

state_initialise_adult <- function(num_stages, initial_size) {
  # Create a vector with all individuals in the adult life stage
  state <- rep(0, num_stages)  # Create a vector of zeros with length num_stages
  state[num_stages] <- initial_size  # Assign initial_size to the final life stage
  return(state)
}

state_initialise_spread <- function(num_stages, initial_size) {
  # Calculate the base number of individuals per life stage
  base_count <- floor(initial_size / num_stages)
  
  # Determine the remaining individuals to distribute
  remainder <- initial_size %% num_stages
  
  # Create a state vector with the base count for each stage
  state <- rep(base_count, num_stages)
  
  # Distribute the remainder starting from the youngest life stage
  if (remainder > 0) {
    state[1:remainder] <- state[1:remainder] + 1
  }
  
  return(state)
}
