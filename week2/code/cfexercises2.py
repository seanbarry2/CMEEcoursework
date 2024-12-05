#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates various implementations of functions that print "hello" under different conditions using loops.
"""

########################
def hello_1(x):
    """
    Prints 'hello' for each number in the range [0, x) that is divisible by 3.

    Parameters:
    x (int): The upper limit of the range.

    Returns:
    None
    """
    for j in range(x):
        if j % 3 == 0:
            print('hello')
    print(' ')

hello_1(12)

########################
def hello_2(x):
    """
    Prints 'hello' for each number in the range [0, x) where:
    - The number modulo 5 equals 3, or
    - The number modulo 4 equals 3.

    Parameters:
    x (int): The upper limit of the range.

    Returns:
    None
    """
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3:
            print('hello')
    print(' ')

hello_2(12)

########################
def hello_3(x, y):
    """
    Prints 'hello' for each number in the range [x, y).

    Parameters:
    x (int): The starting value of the range (inclusive).
    y (int): The ending value of the range (exclusive).

    Returns:
    None
    """
    for i in range(x, y):
        print('hello')
    print(' ')

hello_3(3, 17)

########################
def hello_4(x):
    """
    Prints 'hello' repeatedly until x equals 15, incrementing x by 3 in each iteration.

    Parameters:
    x (int): The starting value.

    Returns:
    None
    """
    while x != 15:
        print('hello')
        x = x + 3
    print(' ')

hello_4(0)

########################
def hello_5(x):
    """
    Prints 'hello' under the following conditions while x is less than 100:
    - Prints 'hello' 7 times if x equals 31.
    - Prints 'hello' once if x equals 18.
    Increments x by 1 in each iteration.

    Parameters:
    x (int): The starting value.

    Returns:
    None
    """
    while x < 100:
        if x == 31:
            for k in range(7):
                print('hello')
        elif x == 18:
            print('hello')
        x = x + 1
    print(' ')

hello_5(12)

# WHILE loop with BREAK
def hello_6(x, y):
    """
    Prints 'hello' along with the value of y while x is True.
    - Increments y by 1 in each iteration.
    - Breaks the loop if y equals 6.

    Parameters:
    x (bool): A condition to continue the loop (True to start the loop).
    y (int): The starting value of y.

    Returns:
    None
    """
    while x:  # while x is True
        print("hello! " + str(y))
        y += 1  # increment y by 1 
        if y == 6:
            break
    print(' ')

hello_6(True, 0)

