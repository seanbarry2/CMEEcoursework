#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script processes a tuple of bird data, where each bird entry contains:
- Latin name (str)
- Common name (str)
- Body mass (float)

The script prints the details of each bird on a separate line in a formatted string.

Example Output:
Latin name: Passerculus sandwichensis Common name: Savannah sparrow Mass: 18.7
...
"""

# Tuple of bird data: (Latin name, Common name, Mass)
birds = (
    ('Passerculus sandwichensis', 'Savannah sparrow', 18.7),
    ('Delichon urbica', 'House martin', 19),
    ('Junco phaeonotus', 'Yellow-eyed junco', 19.5),
    ('Junco hyemalis', 'Dark-eyed junco', 19.6),
    ('Tachycineata bicolor', 'Tree swallow', 20.2),
)
"""
birds:
A tuple of tuples, each containing the Latin name, common name, and mass of a bird.
"""

# Iterate over each bird in the birds tuple and print its details
for bird in birds:
    """
    Unpacks each bird tuple into `latin_name`, `common_name`, and `mass`.
    Prints the details of each bird in a formatted string.
    """
    latin_name, common_name, mass = bird
    print(f"Latin name: {latin_name} Common name: {common_name} Mass: {mass}")

