#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
control_flow.py
This script demonstrates the use of control flow statements in Python through various examples:
- Checking if a number is even or odd.
- Finding the largest divisor of a number among 2, 3, 4, 5.
- Determining whether a number is prime.
- Listing all prime numbers up to a given number.

Usage:
    Run the script to see examples of the functions in action.
"""

__appname__ = '[control_flow]'
__author__ = 'Sean Barry (sb4524@ic.ac.uk)'
__version__ = '0.1.0'
__license__ = "NA"

import sys

def even_or_odd(x=0): # if not specified, x should take value 0.
    """
    Determine whether a number is even or odd.

    Parameters:
    x (int): The number to check. Defaults to 0.

    Returns:
    str: A string stating whether the number is even or odd.
    """
    
    if x % 2 == 0: #The conditional if
        return f"{x} is Even!"
    return f"{x} is Odd!"

def largest_divisor_five(x=120):
    """
    Find the largest divisor of a number among 2, 3, 4, 5.

    Parameters:
    x (int): The number to check. Defaults to 120.

    Returns:
    str: A string stating the largest divisor of the number, or a message if none are found.
    """
    
    largest = 0
    if x % 5 == 0:
        largest = 5
    elif x % 4 == 0: #means "else, if"
        largest = 4
    elif x % 3 == 0:
        largest = 3
    elif x % 2 == 0:
        largest = 2
    else: # When all other (if, elif) conditions are not met
        return f"No divisor found for {x}!" # Each function can return a value or a variable.
    return f"The largest divisor of {x} is {largest}"

def is_prime(x=70):
    """
    Determine whether a number is prime.

    Parameters:
    x (int): The number to check. Defaults to 70.

    Returns:
    bool: True if the number is prime, False otherwise.
    """
    
    for i in range(2, x): #  "range" returns a sequence of integers
        if x % i == 0:
            print(f"{x} is not a prime: {i} is a divisor") 
            return False
    print(f"{x} is a prime!")
    return True 

def find_all_primes(x=22):
    """
    Find all prime numbers up to a given number.

    Parameters:
    x (int): The upper limit for finding prime numbers. Defaults to 22.

    Returns:
    list: A list of all prime numbers up to x.
    """
    
    allprimes = []
    for i in range(2, x + 1):
        if is_prime(i):
            allprimes.append(i)
    print(f"There are {len(allprimes)} primes between 2 and {x}")
    return allprimes
      
def main(argv):
    """
    Main entry point of the script.

    Parameters:
    argv (list): Command-line arguments.

    Returns:
    int: Exit status (0 for success).
    """
    
    print(even_or_odd(22))
    print(even_or_odd(33))
    print(largest_divisor_five(120))
    print(largest_divisor_five(121))
    print(is_prime(60))
    print(is_prime(59))
    print(find_all_primes(100))
    return 0

if (__name__ == "__main__"):
    status = main(sys.argv)
    sys.exit(status)

