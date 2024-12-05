#!/bin/sh
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
oaks_debugme.py
This script processes a CSV file containing tree genus and species data, identifying rows where the genus is 'Quercus' (case-insensitive).
Filtered rows are saved to an output file.

Features:
- Validates the `is_an_oak` function using doctests.
- Writes filtered data to a CSV file, preserving column headers.

Usage:
    python oaks_debugme.py

Input:
    ../data/TestOaksData.csv (must exist)

Output:
    ../results/JustOaksData.csv
"""

import csv
import sys

def is_an_oak(name):
    """
    Returns True if name starts with 'quercus' (case-insensitive, spelling sensitive).

    Parameters:
    name (str): The genus name of the tree.

    Returns:
    bool: True if the genus name starts with 'quercus', False otherwise.

    Examples:
    >>> is_an_oak('Quercus robur')
    True
    >>> is_an_oak('Fagus sylvatica')
    False
    >>> is_an_oak('QUERCUS cerris')
    True
    >>> is_an_oak('Quercus')
    True
    >>> is_an_oak('quercus')
    True
    """
    return name.lower().startswith('quercus')


def main(argv):
    """
    Main function to read tree data from a CSV file, filter rows with genus 'Quercus', 
    and write the results to a new CSV file.

    Parameters:
    argv (list): Command-line arguments (not used).

    Returns:
    int: Exit status (0 for success).
    """
    f = open('../data/TestOaksData.csv', 'r')
    g = open('../results/JustOaksData.csv', 'w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()

    next(taxa)  # Skip the header row (assumes first row contains 'genus' and 'species')

    for row in taxa:
        print("The genus is: ")
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!!!\n')
            csvwrite.writerow([row[0], row[1]])

    return 0


if __name__ == "__main__":
    import doctest
    doctest.testmod()  # This will run the doctests
    status = main(sys.argv)

