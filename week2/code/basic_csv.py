#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates reading from and writing to CSV files in Python.

Features:
1. Reads a CSV file containing species data.
2. Extracts all rows into a list of tuples and prints each row, including the species name.
3. Writes a new CSV file containing only the species name and the male body mass.

Input:
    - `../data/testcsv.csv`: A CSV file with the following columns:
      'Species', 'Infraorder', 'Family', 'Distribution', 'Body mass male (Kg)'.

Output:
    - `../data/bodymass.csv`: A CSV file containing:
      'Species', 'Body mass male (Kg)'.
"""

import csv

# Read a file containing species data
with open('../data/testcsv.csv', 'r') as f:
    """
    Reads the CSV file `testcsv.csv` and prints each row along with the species name.

    Operations:
    - Each row is appended to a list `temp` as a tuple.
    - Prints the entire row and the species name (first column).

    Input:
    - `../data/testcsv.csv`: Source CSV file.

    Variables:
    - csvread: A CSV reader object for reading the file line by line.
    - temp: A list to store rows as tuples.
    """
    csvread = csv.reader(f)
    temp = []
    for row in csvread:
        temp.append(tuple(row))
        print(row)
        print("The species is", row[0])

# Write a file containing only species name and body mass
with open('../data/testcsv.csv', 'r') as f:
    """
    Reads the CSV file `testcsv.csv` and writes a new file `bodymass.csv`
    containing only the species name and the male body mass.

    Operations:
    - Reads each row from the source CSV file.
    - Writes a new CSV file containing only the first column (species name)
      and the fifth column (body mass male).

    Input:
    - `../data/testcsv.csv`: Source CSV file.

    Output:
    - `../data/bodymass.csv`: Output CSV file containing the filtered data.

    Variables:
    - csvread: A CSV reader object for reading the file line by line.
    - csvwrite: A CSV writer object for writing the filtered data to the output file.
    """
    with open('../data/bodymass.csv', 'w') as g:
        csvread = csv.reader(f)
        csvwrite = csv.writer(g)
        for row in csvread:
            print(row)
            csvwrite.writerow([row[0], row[4]])

