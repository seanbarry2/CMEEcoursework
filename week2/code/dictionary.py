#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates how to create a dictionary mapping order names to sets of taxa 
from a list of tuples containing species and their respective orders. 
It includes both a conventional loop-based approach and a list comprehension.

Features:
1. Populates a dictionary `taxa_dic` using a for loop.
2. Populates a dictionary `taxa_dic_c` using a dictionary comprehension.
3. Prints the resulting dictionaries to the screen.

Example Output:
- {'Chiroptera': {'Myotis lucifugus'}, 'Rodentia': {'Gerbillus henleyi', ...}, ...}
"""

# Define a list of taxa containing species and their orders
taxa = [ 
    ('Myotis lucifugus', 'Chiroptera'),
    ('Gerbillus henleyi', 'Rodentia'),
    ('Peromyscus crinitus', 'Rodentia'),
    ('Mus domesticus', 'Rodentia'),
    ('Cleithrionomys rutilus', 'Rodentia'),
    ('Microgale dobsoni', 'Afrosoricida'),
    ('Microgale talazaci', 'Afrosoricida'),
    ('Lyacon pictus', 'Carnivora'),
    ('Arctocephalus gazella', 'Carnivora'),
    ('Canis lupus', 'Carnivora'),
]

# Populate a dictionary using a for loop
taxa_dic = {}
"""
taxa_dic:
A dictionary where keys are order names, and values are sets of species in that order.
"""

for species, order in taxa:
    """
    Iterates through each species and order in the `taxa` list.
    - If the order is not already a key in the dictionary, it initializes the key with an empty set.
    - Adds the species to the corresponding set.

    Variables:
    - species (str): The name of the species.
    - order (str): The order to which the species belongs.
    """
    if order not in taxa_dic:
        taxa_dic[order] = set()
    taxa_dic[order].add(species)

print(taxa_dic)

# Populate a dictionary using a dictionary comprehension
taxa_dic_c = {order: {species for species, o in taxa if o == order} for _, order in taxa}
"""
taxa_dic_c:
A dictionary comprehension that achieves the same result as the loop-based approach.
- Iterates over each unique order in `taxa`.
- Creates a set of species corresponding to each order.

Returns:
- dict: A dictionary mapping orders to sets of species.
"""

print(taxa_dic_c)

