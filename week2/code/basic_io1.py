#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
basic_io1.py
This script demonstrates basic file input operations in Python. It reads a text file and prints its contents.

Features:
1. Reads a file and prints each line, removing trailing newlines.
2. Skips and excludes blank lines while printing.

Usage:
Place a text file named `test.txt` in the `sandbox` directory.
The script expects the file path to be `../sandbox/test.txt`.

Error Handling:
- Handles FileNotFoundError if the file is missing.
- Catches and prints any unexpected exceptions.
"""

# Define the file path
file_path = '../sandbox/test.txt'

try:
    # Open the file for reading using a context manager
    with open(file_path, 'r') as f:
        """
        Reads and prints all lines from the file.

        Operations:
        - Strips trailing newlines using `line.strip()` for cleaner output.
        """
        print("Reading all lines:")
        for line in f:
            print(line.strip())  # Remove trailing newlines for cleaner output

    print("\nReading non-blank lines:")

    # Reopen the file for skipping blank lines
    with open(file_path, 'r') as f:
        """
        Reads and prints non-blank lines from the file.

        Operations:
        - Strips lines of whitespace using `line.strip()`.
        - Prints lines only if they are not empty.
        """
        for line in f:
            if line.strip():  # Check if line is not empty after stripping
                print(line.strip())

except FileNotFoundError:
    """
    Handles the case where the file does not exist.

    Prints an error message indicating the file is missing.
    """
    print(f"Error: The file '{file_path}' does not exist. Please check the file path and try again.")

except Exception as e:
    """
    Handles any other unexpected exceptions.

    Prints a message with the exception details.
    """
    print(f"An unexpected error occurred: {e}")

