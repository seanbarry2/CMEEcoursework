#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script identifies oak trees from a list of species names and performs operations
to filter and transform the list using both for loops and list comprehensions.

Features:
1. Filters oak species from a list of taxa.
2. Converts oak species names to uppercase.
3. Demonstrates both for loop and list comprehension approaches.
"""

# List of species
taxa = [
    'Quercus robur',
    'Fraxinus excelsior',
    'Pinus sylvestris',
    'Quercus cerris',
    'Quercus petraea',
]
"""
taxa:
A list of species names, including oaks (genus `Quercus`) and non-oaks.
"""

def is_an_oak(name):
    """
    Checks if the given species name belongs to the genus 'Quercus' (oak trees).

    Parameters:
    name (str): The species name to check.

    Returns:
    bool: True if the species name starts with 'Quercus ' (case-insensitive), False otherwise.
    """
    return name.lower().startswith('quercus ')

# Using for loops to find oak trees
oaks_loops = set()
"""
oaks_loops:
A set to store oak species filtered using a for loop.
"""

for species in taxa:
    """
    Iterates through the `taxa` list and adds species to the `oaks_loops` set
    if they belong to the genus 'Quercus'.
    """
    if is_an_oak(species):
        oaks_loops.add(species)
print(oaks_loops)

# Using list comprehensions to find oak trees
oaks_lc = set([species for species in taxa if is_an_oak(species)])
"""
oaks_lc:
A set created using a list comprehension to store oak species from `taxa`.
"""
print(oaks_lc)

# Using for loops to get oak species names in uppercase
oaks_loops = set()
"""
oaks_loops:
A set to store uppercase oak species names filtered using a for loop.
"""

for species in taxa:
    """
    Iterates through the `taxa` list and adds uppercase oak species names
    to the `oaks_loops` set if they belong to the genus 'Quercus'.
    """
    if is_an_oak(species):
        oaks_loops.add(species.upper())
print(oaks_loops)

# Using list comprehensions to get oak species names in uppercase
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
"""
oaks_lc:
A set created using a list comprehension to store uppercase oak species names from `taxa`.
"""
print(oaks_lc)

