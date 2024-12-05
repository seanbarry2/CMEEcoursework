#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates a simple function `foo` that modifies an input 
by multiplying it by itself and prints the result.
"""

def foo(x):
    """
    Multiplies the input by itself and prints the result.

    Parameters:
    x (int or float): The input value to be squared.

    Returns:
    None: The function directly prints the squared value.
    """
    x *= x  # Square the input value
    print(x)  # Print the result

foo(2)

