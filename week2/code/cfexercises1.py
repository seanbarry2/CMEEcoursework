#!/usr/bin/env python3

"""Module with various utility functions for mathematical operations."""

__author__ = 'Sean Barry (sb4524@ic.ac.uk)'
__version__ = '0.1.0'

import sys

def foo_1(x):
    """Return the square root of x."""
    return x ** 0.5

def foo_2(x, y):
    """Return the larger of x and y."""
    return x if x > y else y

def foo_3(x, y, z):
    """Sort and return x, y, z in ascending order."""
    if x > y:
        x, y = y, x
    if y > z:
        y, z = z, y
    return [x, y, z]

def foo_4(x):
    """Calculate the factorial of x using iteration."""
    result = 1
    for i in range(1, x + 1):
        result *= i
    return result

def foo_5(x):
    """Calculate the factorial of x recursively."""
    if x == 1:
        return 1
    return x * foo_5(x - 1)

def foo_6(x):
    """Calculate the factorial of x without an if statement."""
    facto = 1
    while x >= 1:
        facto *= x
        x -= 1
    return facto

def main(argv):
    """Run test cases for each function in the module."""
    print("Running test cases for each foo_x function...\n")
    
    print("foo_1(25):", foo_1(25))  # Should return the square root of 25
    print("foo_2(10, 20):", foo_2(10, 20))  # Should return the larger of 10 and 20
    print("foo_3(3, 1, 2):", foo_3(3, 1, 2))  # Should sort and return [1, 2, 3]
    print("foo_4(5):", foo_4(5))  # Should return 120, the factorial of 5
    print("foo_5(10):", foo_5(10))  # Should return 3628800, the factorial of 10
    print("foo_6(6):", foo_6(6))  # Should return 720, the factorial of 6

    print("\nDone!")

if __name__ == "__main__":
    main(sys.argv)

