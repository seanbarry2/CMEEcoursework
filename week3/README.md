**Week 3 Readme - Basics in R (and Jupyter notebook)**

This project focuses on teaching the basics of data wrangling and visualization in R. Key objectives include structuring raw data, making Rscripts, automating data manipulation, and producing clear, reproducible visualizations to reveal trends within the dataset. Additionally, a brief introduction into Jupyter notebook was completed, where the layout and basic usage of the program were clarified.

**Languages**
R (v4.x)

**Dependencies**
tidyverse – for comprehensive data manipulation and visualization
reshape2 – for transforming data between wide and long formats
ggplot2 (included in tidyverse) – for data visualization
sqldf – for running SQL statements on R data frames

**Code**
apply1.R
Demonstrates the use of the apply() function on a matrix. Calculates the mean and variance for each row and the mean for each column of a randomly generated 10x10 matrix.

apply2.R
Highlights the use of a custom function with the apply() function. Performs a conditional operation on each row of a matrix, multiplying elements by 100 if their sum is positive.

basic_io.R
Introduces basic input/output operations in R, including reading a CSV file, writing and appending data to files, and handling headers and row names.

boilerplate.R
A template script showcasing basic function creation, argument handling, and output in R.

break.R
Demonstrates the use of the break statement in loops by exiting a while loop when a specified condition is met.

browse.R
Simulates exponential growth and demonstrates the use of the browser() function for debugging.

control_flow.R
Provides examples of basic control flow structures, including if/else statements and for loops, with simple and practical demonstrations.

DataWrang.R
Focuses on the initial processing of the Pound Hill dataset, including loading, converting, and transforming the data.

Florida.R
Performs statistical analysis on temperature data, including a permutation test to evaluate the significance of an observed correlation coefficient.

Girko.R
Explores mathematical operations involving eigenvalues and ellipses, featuring a custom function for generating ellipses and visualizing them with ggplot2.

MyBars.R
Demonstrates complex plotting techniques in ggplot2, including the use of lineranges and custom annotations.

MyFirstJupyterNb.ipynb
Jupyter notebook containing a few lines of code used to teach basics of Jupyter.

next.R
Illustrates the use of the next statement in loops to skip specific iterations, printing only odd numbers by skipping even ones.

plotLin.R
Performs linear regression analysis and visualizes the results.

PP_Regress.R
Conducts grouped linear regression analysis on predator-prey data, summarizing key metrics such as slope, intercept, and R-squared.

preallocate.R
Compares the performance of functions with and without memory preallocation, highlighting its impact on execution time.

R_conditionals.R
Demonstrates conditional statements through functions that check for properties such as evenness, powers of 2, and primality.

Ricker.R
Simulates the Ricker model for population dynamics.

sample.R
Contains functions for sampling from a population and calculating means, emphasizing the performance benefits of memory preallocation.

SQLinR.R
Showcases how to integrate SQL database operations within R scripts.

TestR.py
This script executes an R script (TestR.R) from within Python and redirects the output and error messages to specified files.

TestR.R
Prints "Hello, this is R!"

TreeHeight.R
Calculates tree heights based on distance and angle measurements using trigonometry. Reads data from a CSV file and applies the formula to compute tree heights.

try.R
Demonstrates error handling and conditional execution with a custom sampling function, showcasing the use of try() for managing errors in loops.

Vectorize.R
This script compares the efficiency of loop-based and vectorized approaches for summing all elements of a matrix.

**Author**
Sean Barry
Email: sb4524@ic.ac.uk
