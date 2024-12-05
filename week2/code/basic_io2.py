#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

#############################
# FILE OUTPUT
#############################

"""
basic_io2.py
This script demonstrates basic file output operations in Python.
It writes the elements of a list to a text file, each on a new line.

Usage:
The output file will be saved as `testout.txt` in the `sandbox` directory.
Ensure the `sandbox` directory exists before running the script.

Error Handling:
- Handles FileNotFoundError if the target directory does not exist.
- Catches and prints any unexpected exceptions.
"""

# Define the file path
output_path = '../sandbox/testout.txt'

# Create a list of numbers to save
list_to_save = range(100)
"""
list_to_save:
A range object representing numbers from 0 to 99.
This list is written to the output file, with one number per line.
"""

try:
    # Open the file for writing using a context manager
    with open(output_path, 'w') as f:
        """
        Writes the elements of `list_to_save` to the output file.

        Operations:
        - Iterates through `list_to_save`.
        - Writes each number to the file, followed by a newline.

        Input:
        - list_to_save: A list of integers to write.

        Output:
        - Creates a file `testout.txt` in the `sandbox` directory.
        """
        for i in list_to_save:
            f.write(f"{i}\n")  # Write each element followed by a newline
    print(f"File successfully written to: {output_path}")

except FileNotFoundError:
    """
    Handles the case where the target directory does not exist.

    Prints an error message indicating the missing directory.
    """
    print(f"Error: Directory '../sandbox' does not exist. Please create the directory and try again.")

except Exception as e:
    """
    Handles any other unexpected exceptions.

    Prints a message with the exception details.
    """
    print(f"An unexpected error occurred: {e}")

