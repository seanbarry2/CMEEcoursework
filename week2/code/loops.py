#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates the use of `for` and `while` loops in Python.

Features:
1. A `for` loop to iterate over a range of numbers.
2. A `for` loop to iterate over elements in a list.
3. A `for` loop to compute a cumulative sum from a list of integers.
4. A `while` loop to count up to a specified limit.
"""

# FOR loops
for i in range(5):
    """
    Iterates over a range of numbers from 0 to 4 (inclusive) and prints each number.

    Variables:
    - i (int): The current number in the range.

    Output:
    - Prints numbers 0, 1, 2, 3, 4.
    """
    print(i)

my_list = [0, 2, "geronimo!", 3.0, True, False]
"""
my_list:
A list containing mixed data types including integers, a string, floats, and booleans.
"""

for k in my_list:
    """
    Iterates over each element in `my_list` and prints it.

    Variables:
    - k: The current element in `my_list`.

    Output:
    - Prints each element in the list.
    """
    print(k)

total = 0
summands = [0, 1, 11, 111, 1111]
"""
summands:
A list of integers used for cumulative sum calculation.
total:
An integer initialized to 0 to store the cumulative sum.
"""

for s in summands:
    """
    Iterates over `summands` and computes a cumulative sum.

    Variables:
    - s (int): The current number being added.
    - total (int): The running total of the cumulative sum.

    Output:
    - Prints the running total after adding each number.
    """
    total = total + s
    print(total)

# WHILE loop
z = 0
"""
z:
An integer initialized to 0 used for counting up to 100.
"""

while z < 100:
    """
    Increments `z` by 1 in each iteration and prints its value.

    Conditions:
    - The loop continues until `z` reaches 100.

    Variables:
    - z (int): The current count.

    Output:
    - Prints numbers from 1 to 100.
    """
    z = z + 1
    print(z)

