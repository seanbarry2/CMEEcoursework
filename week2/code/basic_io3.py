#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

#############################
# STORING OBJECTS
#############################

"""
basic_io3.py
This script demonstrates storing and loading Python objects using the `pickle` module.
It saves a dictionary object to a file in binary format and then loads it back into memory.

Usage:
The script saves the object to `testp.p` in the `sandbox` directory. Ensure this directory exists before running the script.

Error Handling:
- Handles FileNotFoundError if the target directory does not exist.
- Handles PickleError for issues during pickling or unpickling.
- Catches and prints any unexpected exceptions.
"""

import os
import pickle

# Define the file path
file_path = '../sandbox/testp.p'
"""
file_path:
The path to the binary file where the dictionary will be saved and loaded from.
"""

# Create a dictionary object to save
my_dictionary = {"a key": 10, "another key": 11}
"""
my_dictionary:
A sample dictionary to demonstrate storing and loading objects using the `pickle` module.
"""

try:
    # Save the dictionary using pickle
    with open(file_path, 'wb') as f:
        """
        Saves `my_dictionary` to a file using the `pickle` module.

        Operations:
        - Opens the file in binary write mode (`wb`).
        - Serializes `my_dictionary` and writes it to the file.

        Input:
        - my_dictionary: The dictionary to save.

        Output:
        - A binary file `testp.p` in the `sandbox` directory.
        """
        pickle.dump(my_dictionary, f)
    print(f"Dictionary successfully saved to: {file_path}")

    # Load the dictionary back
    with open(file_path, 'rb') as f:
        """
        Loads the dictionary from the binary file using the `pickle` module.

        Operations:
        - Opens the file in binary read mode (`rb`).
        - Deserializes the binary data to reconstruct the original dictionary.

        Output:
        - another_dictionary: The dictionary loaded from the file.
        """
        another_dictionary = pickle.load(f)
    print("Dictionary successfully loaded:")
    print(another_dictionary)

except FileNotFoundError:
    """
    Handles the case where the target directory does not exist.

    Prints an error message indicating the missing directory.
    """
    print(f"Error: Directory '../sandbox' does not exist. Please create the directory and try again.")

except pickle.PickleError:
    """
    Handles errors that occur during pickling or unpickling.

    Prints a generic error message for issues with serialization or deserialization.
    """
    print("Error: An issue occurred during pickling or unpickling.")

except Exception as e:
    """
    Handles any other unexpected exceptions.

    Prints a message with the exception details.
    """
    print(f"An unexpected error occurred: {e}")

