# README - Week 2 Code Review

#Overview

This repository contains a collection of Python scripts developed during Week 2. The scripts cover various programming concepts such as file I/O, sequence alignment, basic mathematical functions, control flow, object handling, and more. Below is an overview of the key features, functionality, and use cases for each component of the code.
  
# CSV File Operations ('basic_csv.py')

- Purpose: Various scripts handle CSV file reading and writing.
- Features:
  - Reads a CSV file and processes data row by row.
  - Extracts specific columns such as species names and body mass, and writes them to a new CSV file.
  - Example files:
    - `testcsv.csv`: A file containing columns like 'Species', 'Family', and 'Body mass (kg)'.
    - `bodymass.csv`: Output file containing species and body mass.

# File Input/Output (I/O) ('basicIOx.py')

- Purpose: Several scripts demonstrate how to handle file input and output in Python.
- Features:
  - Reading from text files, skipping blank lines.
  - Writing data, such as lists or numbers, to files.
  - Using the `pickle` module to store and retrieve Python objects (e.g., dictionaries) for later use.

# Global and Local Variables ('scope.py')

- Purpose: Examples of how Python handles global and local variable scopes.
- Features:
  - Demonstrates the difference between global and local variables.
  - Shows the impact of using `global` keyword to modify global variables inside functions.
  
# Docstring Testing ('control_flow.py')

- Purpose: Demonstrates how to integrate tests directly within function docstrings using `doctest`.
- Features:
  - Functions include embedded tests that can be run using the `doctest` module.
  - Example: Testing the `even_or_odd` function for different numbers.
  
# Control flow practical (`cfexercises1.py`)

- Purpose: Utility functions for basic mathematical and sorting operations.
- Features:
  - Functions such as `foo_1` (square root), `foo_2` (maximum of two values), and `foo_3` (sorting three values).
  - Factorial calculation implemented iteratively, recursively, and using a `while` loop.
  - Functions can be tested by running the `main()` function.
  - Illustrates how loops operate under different conditions.
- How to Use:
  - Call any of the `foo_x` functions directly, or run the script to see test cases.
  
# Loops and list comprehensions practical ('lc1.py, lc2.py, dictionary.py, tuple.py')

- Purpose: Basic loops and list comprehensions that make the terminal print something useful.
- Features:
  - Loops/list comprehensions that print latin names, common names and mean body weight of birds.
  - Loops/list comprehensions that print months by specific rainfall amounts.
  - Loops that populates a dictionary with mammals.
- How to use: 
  - Call any of the functions directly, or run the script.
  
# Align DNA seqs practical ('align_seqs.py')

- Purpose: Aligns two sequences of DNA to see what combination has the highest similarity.
- Features: 
  - Reads sequences from a CSV file using 'csv.reader'.
  - Aligns the sequences by calculating the alignment score with a scoring function.
  - Outputs the best alignment and score into a text file stored in the '../results' directory.
  
# Missing oaks

- Purpose: Searches through a csv file and finds oaks which are then outputted into a folder in '../results'.
- Features:
  - Defines oaks (all trees that have a genus name being 'quercus'.
  - Reads a csv file containing all trees in question.
  - Finds the oaks and prints them all into a file in the '../results' folder.

# Dependencies

- Python 3.x
- Modules:
  - `csv` (standard library)
  - `os` (standard library)
  - `sys` (standard library)
  - `pickle` (standard library)
  - `doctest` (optional for docstring testing)

# Author

Sean Barry
Contact: sb4524@ic.ac.uk
