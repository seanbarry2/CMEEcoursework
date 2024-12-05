# Summary of Control Flow Structures in R:
# 1. **if-else**: Used for conditional execution of code. Executes different blocks based on whether a condition is TRUE or FALSE.
# 2. **for loop**: Used to iterate over elements in a sequence (e.g., vector, list).
# 3. **while loop**: Repeatedly executes code as long as a specified condition remains TRUE.

# Example 1: Using an if-else statement
a <- TRUE  # Initialize a logical variable
if (a == TRUE) {  
  # Check if `a` is TRUE
  print("a is TRUE")  # Print if the condition is met
} else {  
  # Execute this block if `a` is not TRUE
  print("a is FALSE")  
}

# Example 2: Using a for loop
for (i in 1:5) {  
  # Iterate over numbers 1 to 5
  print(paste("Iteration number:", i))  
}

# Example 3: Using a while loop
counter <- 1  # Initialize a counter variable
while (counter <= 5) {  
  # Continue looping as long as counter is less than or equal to 5
  print(paste("Counter value:", counter))  
  counter <- counter + 1  # Increment the counter
}