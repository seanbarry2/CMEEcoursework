# CMEE 2024 HPC exercises R code main pro forma
# You don't HAVE to use this but it will be very helpful.
# If you opt to write everything yourself from scratch please ensure you use
# EXACTLY the same function and parameter names and beware that you may lose
# marks if it doesn't work properly because of not using the pro-forma.

name <- "Sean Barry"
preferred_name <- "Sean"
email <- "sb4524@ic.ac.uk"
username <- "abc123"

# Please remember *not* to clear the work space here, or anywhere in this file.
# If you do, it'll wipe out your username information that you entered just
# above, and when you use this file as a 'toolbox' as intended it'll also wipe
# away everything you're doing outside of the toolbox.  For example, it would
# wipe away any automarking code that may be running and that would be annoying!

# Section One: Stochastic demographic population model

source("Demographic.R")

# Question 0

state_initialise_adult <- function(num_stages,initial_size){
  state <- rep(0, num_stages)
  state[num_stages] <- initial_size
  return(state)
}

state_initialise_spread <- function(num_stages,initial_size){
  base_count <- floor(initial_size / num_stages)
  remainder <- initial_size %% num_stages
  state <- rep(base_count, num_stages)
  if (remainder > 0) {
    state[1:remainder] <- state[1:remainder] + 1
  }
  return(state)
}

# Question 1
question_1 <- function(){
  # define projection matrix
  growth_matrix <- matrix(c(0.1, 0.0, 0.0, 0.0, 0.5, 0.4, 0.0, 0.0, 0.0, 0.4, 0.7, 0.0, 0.0, 0.0, 0.25, 0.4), nrow = 4, ncol = 4, byrow = TRUE)
  reproduction_matrix <- matrix(c(0.0, 0.0, 0.0, 2.6, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), nrow = 4, ncol = 4, byrow = TRUE)
  projection_matrix <- reproduction_matrix + growth_matrix
  
  # define simulation length
  simulation_length <- 24
  
  # starting condition 1: 100 individuals in final life stage
  initial_state_adult <- state_initialise_adult(num_stages = 4, initial_size = 100)
  
  # starting condition 2: 100 individuals spread across life stages
  initial_state_spread <- state_initialise_spread(num_stages = 4, initial_size = 100)
  
  # run deterministic simulation
  result_adult <- deterministic_simulation(initial_state_adult, projection_matrix, simulation_length)
  result_spread <- deterministic_simulation(initial_state_spread, projection_matrix, simulation_length)
  
  # make plot
  png(filename = "question_1.png", width = 600, height = 400)
  plot(result_adult, type = "l", col = "blue", lwd = 2, ylim = range(c(result_adult, result_spread)),
       xlab = "Time Step", ylab = "Population Size", main = "Population Size Time Series")
  lines(result_spread, col = "red", lwd = 2)
  legend("topright", legend = c("100 Adults", "100 Spread"), col = c("blue", "red"), lwd = 2)
  dev.off()
  
  return("The hundred adults start off with a burst in population followed by a crash and eventual stabilization. The spread population has a much smaller initial burst/crash and trails the hundred adults throughout. Burst, crash and stabilization occur around the same time.")
}

# Question 2
question_2 <- function(){
  
  # define growth and reproduction matrix
  growth_matrix <- matrix(c(0.1, 0.0, 0.0, 0.0, 0.5, 0.4, 0.0, 0.0, 0.0, 0.4, 0.7, 0.0, 0.0, 0.0, 0.25, 0.4), nrow = 4, ncol = 4, byrow = TRUE)
  reproduction_matrix <- matrix(c(0.0, 0.0, 0.0, 2.6, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0), nrow = 4, ncol = 4, byrow = TRUE)
  
  # define clutch distribution
  clutch_distribution <- c(0.06, 0.08, 0.13, 0.15, 0.16, 0.18, 0.15, 0.06, 0.03)
  
  # define simulation length
  simulation_length <- 24
  
  # starting condition 1: 100 individuals in final life stage
  initial_state_adult <- state_initialise_adult(num_stages = 4, initial_size = 100)
  
  # starting condition 2: 100 individuals spread across life stages
  initial_state_spread <- state_initialise_spread(num_stages = 4, initial_size = 100)
  
  # run stochastic simulation
  result_adult <- stochastic_simulation(initial_state_adult, growth_matrix, reproduction_matrix, clutch_distribution, simulation_length)
  result_spread <- stochastic_simulation(initial_state_spread, growth_matrix, reproduction_matrix, clutch_distribution, simulation_length)
  
  # make plot
  png(filename = "question_2.png", width = 600, height = 400)
  plot(result_adult, type = "l", col = "blue", lwd = 2, ylim = range(c(result_adult, result_spread)),
       xlab = "Time Step", ylab = "Population Size", main = "Population Size Time Series")
  lines(result_spread, col = "red", lwd = 2)
  legend("topright", legend = c("100 Adults", "100 Spread"), col = c("blue", "red"), lwd = 2)
  dev.off()
  
  return("Both the 100-adults and the 100-spread start off with a burst in population. The 100-adults peak at around 340 and the 100-spread at around 140. Both then stabilize after around 5 time-steps and then follow an approximately equal path. They maintain a difference in population of around 100.")
}

# Questions 3 and 4 involve writing code elsewhere to run your simulations on the cluster


# Question 5
question_5 <- function(){
  
  png(filename="question_5", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
  return("type your written answer here")
}

# Question 6
question_6 <- function(){
  
  png(filename="question_6", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
  return("type your written answer here")
}


# Section Two: Individual-based ecological neutral theory simulation 

# Question 7
species_richness <- function(community){
  
}

# Question 8
init_community_max <- function(size){
  
}

# Question 9
init_community_min <- function(size){
  
}

# Question 10
choose_two <- function(max_value){
  
}

# Question 11
neutral_step <- function(community){
  
}

# Question 12
neutral_generation <- function(community){
  
}

# Question 13
neutral_time_series <- function(community,duration)  {
  
}

# Question 14
question_8 <- function() {
  
  
  
  png(filename="question_14", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
  return("type your written answer here")
}

# Question 15
neutral_step_speciation <- function(community,speciation_rate)  {
  
}

# Question 16
neutral_generation_speciation <- function(community,speciation_rate)  {
  
}

# Question 17
neutral_time_series_speciation <- function(community,speciation_rate,duration)  {
  
}

# Question 18
question_18 <- function()  {
  
  png(filename="question_18", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
  return("type your written answer here")
}

# Question 19
species_abundance <- function(community)  {
  
}

# Question 20
octaves <- function(abundance_vector) {
  
}

# Question 21
sum_vect <- function(x, y) {
    # define length of each vector
    len_x <- length(x)
    len_y <- length(y)
    
    # figure out which vector is longer
    longer_len <- max(len_x, len_y)
    
    # extend shorter vector to match length
    if (len_x < longer_len) {
      x <- c(x, rep(0, longer_len - len_x))
    }
    if (len_y < longer_len) {
      y <- c(y, rep(0, longer_len - len_y))
    }
    
    # sum vectors
    return(x + y)
}

# Question 22
question_22 <- function() {
  
  png(filename="question_22", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
  return("type your written answer here")
}

# Question 23
neutral_cluster_run <- function(speciation_rate, size, wall_time, interval_rich, interval_oct, burn_in_generations, output_file_name) {
    
}

# Questions 24 and 25 involve writing code elsewhere to run your simulations on
# the cluster

# Question 26 
process_neutral_cluster_results <- function() {
  
  
  combined_results <- list() #create your list output here to return
  # save results to an .rda file
  
}

plot_neutral_cluster_results <- function(){

    # load combined_results from your rda file
  
    png(filename="plot_neutral_cluster_results", width = 600, height = 400)
    # plot your graph here
    Sys.sleep(0.1)
    dev.off()
    
    return(combined_results)
}


# Challenge questions - these are substantially harder and worth fewer marks.
# I suggest you only attempt these if you've done all the main questions. 

# Challenge question A
Challenge_A <- function(){
  
  png(filename="Challenge_A", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
}

# Challenge question B
Challenge_B <- function() {
  
  png(filename="Challenge_B", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
}

# Challenge question C
Challenge_B <- function() {
  
  png(filename="Challenge_C", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()

}

# Challenge question D
Challenge_D <- function() {
  
  png(filename="Challenge_D", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
}

# Challenge question E
Challenge_E <- function() {
  
  png(filename="Challenge_E", width = 600, height = 400)
  # plot your graph here
  Sys.sleep(0.1)
  dev.off()
  
  return("type your written answer here")
}


