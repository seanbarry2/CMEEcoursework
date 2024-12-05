#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script defines a function that demonstrates a calculation with a potential bug due to division by zero.
The function performs a decrement operation within a loop and computes a quotient at each iteration.

Usage:
Call `buggyfunc(x)` with an integer `x` as the argument.
"""

def buggyfunc(x):
    """
    Performs a decrement operation in a loop and calculates the quotient of x divided by the decremented value.

    Parameters:
    x (int): The initial value used for calculations.

    Returns:
    float: The quotient `z` calculated in the final iteration of the loop.

    Raises:
    ZeroDivisionError: If `y` becomes zero during the loop.
    """
    y = x  # Initialize y with the value of x
    for i in range(x):
        y = y - 1  # Decrement y
        z = x / y  # Compute the quotient
    return z  # Return the final quotient

buggyfunc(20)

