#!/usr/bin/env python3
# Filename: using_name.py
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates the use of the `__name__` variable in Python to determine whether a script
is being run directly or imported as a module.

Features:
1. Prints a message indicating if the script is executed directly or imported.
2. Displays the value of the `__name__` variable.
"""

if __name__ == '__main__':
    """
    Checks if the script is being run directly.
    If so, prints a message to indicate that the program is running by itself.
    """
    print('This program is being run by itself!')
else:
    """
    If the script is being imported as a module, prints a message to indicate that.
    """
    print('I am being imported from another script/program/module!')

# Prints the name of the module (value of `__name__`)
print("This module's name is: " + __name__)

