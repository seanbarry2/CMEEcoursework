# Loop from 1 to 10
for (i in 1:10) {
  # Check if the number is even
  if ((i %% 2) == 0) {  
    next  # Skip the current iteration if the number is even and move to the next iteration
  }
  # Print the number if it is not skipped (i.e., if it is odd)
  print(i)  
}

# Explanation:
# - The `if` condition checks if `i` is divisible by 2 (meaning it has to be even)
# - The `next` statement skips the remaining code in the loop body for that iteration
#   and moves to the next iteration of the loop.
# - As a result, only odd numbers (1, 3, 5, 7, 9) are printed.