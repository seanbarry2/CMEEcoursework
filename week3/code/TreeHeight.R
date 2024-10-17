# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"
setwd("../data")

TreeHeight <- function(angle, dist) {
    radians <- angle * pi / 180
    height <- dist * tan(radians)
    print(paste("Tree height is:", height))
  
    return (height)
}

tree_data <- read.csv("trees.csv")

tree_heights <- numeric(nrow(tree_data))

for (i in 1:nrow(tree_data)) {
	angle <- tree_data$Angle.degrees[i]
	dist <- tree_data$Distance.m[i]
	tree_heights[i] <- TreeHeight(angle, dist)
}

tree_data$Tree.Height.m <- tree_heights

write.csv(tree_data, "../results/TreeHts.csv", row.names = FALSE)


