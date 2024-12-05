#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates the use of control statements and doctests to verify functionality.
It includes:
1. A function to determine if a number is even or odd, with embedded doctests.
2. A main function to run sample tests and print results.
"""

__author__ = 'Sean Barry (sb4524@ic.ac.uk)'
__version__ = '0.0.1'

import sys
import doctest  # Import the doctest module

def even_or_odd(x=0):
    """
    Determines whether a number is even or odd. For negative inputs, the function considers the absolute value.

    Parameters:
    x (int): The number to check. Defaults to 0.

    Returns:
    str: A string indicating whether the number is even or odd.

    Examples:
    >>> even_or_odd(10)
    '10 is Even!'
    
    >>> even_or_odd(5)
    '5 is Odd!'
    
    >>> even_or_odd(-2)
    '-2 is Even!'
    """
    if x % 2 == 0:
        return f"{x} is Even!"
    return f"{x} is Odd!"

def main(argv): 
    """
    Main function to test the `even_or_odd` function and print results.

    Parameters:
    argv (list): Command-line arguments (not used in this example).

    Returns:
    int: Exit status (0 for success).
    """
    print(even_or_odd(22))  # Example: Test with an even number
    print(even_or_odd(33))  # Example: Test with an odd number
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()  # Run the embedded doctests

