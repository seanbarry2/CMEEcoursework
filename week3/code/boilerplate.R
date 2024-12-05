# A boilerplate R script that provides a reusable structure for custom functions

# Define a simple function to demonstrate argument handling and return values
MyFunction <- function(Arg1, Arg2) {
  
  # Print information about the first argument
  print(paste("Argument", as.character(Arg1), "is a", class(Arg1))) 
  # Prints the value of Arg1 and its data type (e.g., numeric, character)
  
  # Print information about the second argument
  print(paste("Argument", as.character(Arg2), "is a", class(Arg2)))
  # Prints the value of Arg2 and its data type
  
  # Return both arguments as a combined vector
  return(c(Arg1, Arg2)) 
  # The function returns a vector containing both Arg1 and Arg2
  # This can be customized or omitted depending on the intended purpose
}

# Test the function with numeric inputs
MyFunction(1, 2)  
# Example usage: Passing numeric arguments, expected output is a numeric vector

# Test the function with character inputs
MyFunction("Riki", "Tiki")  
# Example usage: Passing character arguments, expected output is a character vector