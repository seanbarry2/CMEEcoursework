# Check and load required packages
# Ensure the 'ggplot2' package is installed; stop execution with an error message if not
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("Package 'ggplot2' is required but not installed. Install it with install.packages('ggplot2').")
}
library(ggplot2)  # Load the ggplot2 library for creating visualizations

# Function to generate an ellipse
build_ellipse <- function(hradius, vradius) { 
  # Arguments:
  #   hradius: Horizontal radius of the ellipse
  #   vradius: Vertical radius of the ellipse
  # Returns:
  #   A dataframe containing x and y coordinates for the ellipse
  
  npoints <- 250  # Number of points to define the smoothness of the ellipse
  a <- seq(0, 2 * pi, length = npoints + 1)  # Generate angles from 0 to 2π
  x <- hradius * cos(a)  # Calculate x coordinates based on horizontal radius
  y <- vradius * sin(a)  # Calculate y coordinates based on vertical radius
  return(data.frame(x = x, y = y))  # Return a dataframe with x and y columns
}

N <- 250  # Set the size of the matrix (N x N)

# Generate a random N x N matrix with normally distributed entries
M <- matrix(rnorm(N * N), N, N)  

# Compute the eigenvalues of the matrix
eigvals <- eigen(M)$values  

# Create a dataframe of eigenvalues with real and imaginary parts
eigDF <- data.frame("Real" = Re(eigvals), "Imaginary" = Im(eigvals))

# Compute the radius of the circle as sqrt(N)
my_radius <- sqrt(N)  

# Generate an ellipse with the computed radius
ellDF <- build_ellipse(my_radius, my_radius)  

# Rename the columns of the ellipse dataframe for consistency
names(ellDF) <- c("Real", "Imaginary")

# Initialize the ggplot object with eigenvalue data
p <- ggplot(eigDF, aes(x = Real, y = Imaginary))  

# Add points to represent eigenvalues
p <- p + geom_point(shape = I(3)) + 
  theme(legend.position = "none")  # Remove legend for cleaner visualization

# Add horizontal and vertical lines to represent axes
p <- p + geom_hline(aes(yintercept = 0))  # Horizontal line at y = 0
p <- p + geom_vline(aes(xintercept = 0))  # Vertical line at x = 0

# Overlay the ellipse representing the theoretical boundary
p <- p + geom_polygon(data = ellDF, aes(x = Real, y = Imaginary, alpha = 1/20, fill = "red"))

# Display the plot
p

pdf("../results/Girko.pdf")
print(p)
dev.off()