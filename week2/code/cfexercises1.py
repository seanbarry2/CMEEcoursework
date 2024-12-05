#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
cfexercises1.py
This script contains various utility functions for mathematical operations,
including square root calculations, comparison operations, sorting, and factorials.
The script also includes test cases to demonstrate the functionality of each function.

Features:
- Calculate the square root of a number.
- Compare two numbers and return the larger one.
- Sort three numbers in ascending order.
- Compute factorials using iterative, recursive, and while-loop methods, 
  demonstrating different implementations for learning purposes.

Usage:
Run this script directly to execute the test cases.
"""

__author__ = 'Sean Barry (sb4524@ic.ac.uk)'
__version__ = '0.1.0'

import sys

def foo_1(x):
    """
    Return the square root of x.

    Parameters:
    x (float): A non-negative number.

    Returns:
    float: The square root of x.
    """
    return x ** 0.5

def foo_2(x, y):
    """
    Return the larger of x and y.

    Parameters:
    x, y (int or float): Two numbers to compare.

    Returns:
    int or float: The larger of the two numbers.
    """
    return x if x > y else y

def foo_3(x, y, z):
    """
    Sort and return x, y, z in ascending order.

    Parameters:
    x, y, z (int or float): Three numbers to sort.

    Returns:
    list: A list of the numbers sorted in ascending order.
    """
    if x > y:
        x, y = y, x
    if y > z:
        y, z = z, y
    return [x, y, z]

def foo_4(x):
    """
    Calculate the factorial of x using iteration.

    Parameters:
    x (int): A non-negative integer.

    Returns:
    int: The factorial of x.
    """
    result = 1
    for i in range(1, x + 1):
        result *= i
    return result

def foo_5(x):
    """
    Calculate the factorial of x recursively.

    Parameters:
    x (int): A non-negative integer.

    Returns:
    int: The factorial of x.
    """
    if x == 1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x):
    """
    Calculate the factorial of x using a while loop.

    Parameters:
    x (int): A non-negative integer.

    Returns:
    int: The factorial of x.
    """
    facto = 1
    while x >= 1:
        facto *= x
        x -= 1
    return facto

def main(argv):
    """
    Run test cases for each function in the module.
    Demonstrates the usage and functionality of each function.
    """
    print("Running test cases for each function...\n")
    
    print("foo_1(25):", foo_1(25))  # Square root of 25 (should return 5)
    print("foo_2(10, 20):", foo_2(10, 20))  # Larger of 10 and 20 (should return 20)
    print("foo_3(3, 1, 2):", foo_3(3, 1, 2))  # Sorts [3, 1, 2] (should return 1, 2, 3)
    print("foo_4(5):", foo_4(5))  # Factorial of 5 using iteration (should return 120)
    print("foo_5(10):", foo_5(10))  # Factorial of 10 using recursion (should return 3628800)
    print("foo_6(6):", foo_6(6))  # Factorial of 6 using a while loop (should return 720)

    print("\nDone!")

if __name__ == "__main__":
    main(sys.argv)

