#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
This script demonstrates how to extract specific attributes from a tuple of bird data
using both list comprehensions and conventional loops.

Data:
- A tuple `birds` containing bird species data (latin name, common name, mean body mass).

Objectives:
1. Use list comprehensions to extract:
   - Latin names
   - Common names
   - Mean body masses
2. Perform the same extractions using conventional loops.

Output:
- Prints the extracted lists for both methods.
"""

birds = ( 
    ('Passerculus sandwichensis', 'Savannah sparrow', 18.7),
    ('Delichon urbica', 'House martin', 19),
    ('Junco phaeonotus', 'Yellow-eyed junco', 19.5),
    ('Junco hyemalis', 'Dark-eyed junco', 19.6),
    ('Tachycineata bicolor', 'Tree swallow', 20.2),
)

# (1) Using list comprehensions
latin_names = [bird[0] for bird in birds]
""" 
List comprehension to extract latin names.

Returns:
list: A list of latin names for all bird species in the `birds` tuple.
"""

common_names = [bird[1] for bird in birds]
""" 
List comprehension to extract common names.

Returns:
list: A list of common names for all bird species in the `birds` tuple.
"""

mean_bm = [bird[2] for bird in birds]
""" 
List comprehension to extract mean body masses.

Returns:
list: A list of mean body masses (floats) for all bird species in the `birds` tuple.
"""

print(latin_names)
print(common_names)
print(mean_bm)

# (2) Using loops
latin_names_l = []
""" 
List to store latin names extracted using a conventional loop.
"""

common_names_l = []
""" 
List to store common names extracted using a conventional loop.
"""

mean_bm_l = []
""" 
List to store mean body masses extracted using a conventional loop.
"""

for bird in birds:
    """
    Loop through each bird in the `birds` tuple and extract:
    - Latin name (index 0)
    - Common name (index 1)
    - Mean body mass (index 2)

    Appends the extracted values to their respective lists.
    """
    latin_names_l.append(bird[0])
    common_names_l.append(bird[1])
    mean_bm_l.append(bird[2])
    
print(latin_names_l)
print(common_names_l)
print(mean_bm_l)

